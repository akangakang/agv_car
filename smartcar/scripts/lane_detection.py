#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
from geometry_msgs.msg import Twist
import cv2
import numpy as np
class laneDetector:
    def __init__(self):
        rospy.init_node('lane_detection', anonymous=True)
        rospy.Subscriber('/camera/rgb/image_raw', Image, self.callback)
        self.pub = rospy.Publisher('lane_vel', Twist, queue_size=1)
        '''
        clb robot arguments
        srcMat = np.float32([[130, 270], [30, 470], [470, 270], [620, 470]])
        dstMat = np.float32([[0, 0], [0, 480], [640, 0], [640, 480]])
        '''

        # wheeltec arguments
        srcMat = np.float32([[180, 200], [0, 350], [480, 200], [640, 350]])
        dstMat = np.float32([[0, 0], [0, 465], [620, 0], [620, 480]])

        self.M = cv2.getPerspectiveTransform(srcMat, dstMat)
        self.invM = cv2.getPerspectiveTransform(dstMat, srcMat)
        self.cvb = CvBridge()
        self.flag = 0
        self.idx = 0
        fourcc = cv2.VideoWriter_fourcc('M','J','P','G')
        self.out = cv2.VideoWriter('/home/riki/output.avi',fourcc, 20.0, (640,480))
        print 'Lane Detection starts'
    
    def callback(self, msg):
        try:
            result = self.lane_detection(self.cvb.imgmsg_to_cv2(msg, "bgr8"))
            self.out.write(result)
        except Exception:
            self.quit()
    
    def quit(self):
        twist = Twist()
        twist.linear.x = 0
        twist.angular.z = 0
        self.pub.publish(twist)

    def lane_detection(self, msg):
        binary = self.threshWarp(msg)
        if self.flag == 0:
            self.leftFit, self.rightFit, outImg = self.fitLines(binary)
            self.flag = 1
        elif self.flag == 1:
            self.leftFit, self.rightFit, outImg = self.fitLinesContinuous(binary, self.leftFit, self.rightFit)
        result = self.warpPerspectiveBack(msg, binary, self.leftFit, self.rightFit)
        return result

    def lane_vel(self, left_fit, right_fit, warped, print_data = True):
        left_curverad, right_curverad, center = self.curvature(left_fit, right_fit, warped)
        twist = Twist()
        if center < -2.0:
            print("Turn Left")
            twist.linear.x = 0
            twist.angular.z = 0.3
        elif center > -1.2:
            print("Turn Right")
            twist.linear.x = 0
            twist.angular.z = -0.3
        else:
            print("Go Straight")
            twist.linear.x = 0.1
            twist.angular.z = 0
        self.pub.publish(twist)

    def curvature(self, left_fit, right_fit, binary_warped,print_data = True):
        ploty = np.linspace(0,binary_warped.shape[0] -1 , binary_warped.shape[0])
        y_eval = np.max(ploty)
        #y_eval就是曲率，这里是选择最大的曲率
        
        ym_per_pix = 30/720#在y维度上 米/像素
        xm_per_pix = 3.7/700#在x维度上 米/像素
        
        #确定左右车道
        leftx = left_fit[0]*ploty**2 + left_fit[1]*ploty + left_fit[2]
        rightx = right_fit[0]*ploty**2 + right_fit[1]*ploty + right_fit[2]
        
        #定义新的系数在米
        left_fit_cr = np.polyfit(ploty*ym_per_pix, leftx*xm_per_pix, 2)
        right_fit_cr = np.polyfit(ploty*ym_per_pix, rightx*xm_per_pix, 2)
        #最小二乘法拟合
        print(left_fit_cr[0], right_fit_cr[0])
        #计算新的曲率半径
        left_curverad = ((1 + (2*left_fit_cr[0]*y_eval*ym_per_pix + left_fit_cr[1])**2)**1.5) / np.absolute(2*left_fit_cr[0])
        right_curverad = ((1 + (2*right_fit_cr[0]*y_eval*ym_per_pix + right_fit_cr[1])**2)**1.5) / np.absolute(2*right_fit_cr[0])
        
        #计算中心点，线的中点是左右线底部的中间
        left_lane_bottom = (left_fit[0]*y_eval)**2 + left_fit[0]*y_eval + left_fit[2]
        right_lane_bottom = (right_fit[0]*y_eval)**2 + right_fit[0]*y_eval + right_fit[2]
        lane_center = (left_lane_bottom + right_lane_bottom)/2.
        center_image = 640
        center = (lane_center - center_image)*xm_per_pix#转换成米
        
        if print_data == True:
            #现在的曲率半径已经转化为米了
            print(left_curverad, 'm', right_curverad, 'm', center, 'm')
    
        return left_curverad, right_curverad, center

    def threshWarp(self, img):
        cv2.fastNlMeansDenoisingColored(img, img, 3.0, 7, 21)
        hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
        # filter red blocks
        binaryImg = cv2.inRange(hsv, (0, 40, 40), (20, 255, 255))
        warp = cv2.warpPerspective(binaryImg, self.M, (img.shape[1], img.shape[0]),flags=cv2.INTER_LINEAR)
        return warp

    def fitLines(self, binaryImg):
        histogram = np.sum(binaryImg[binaryImg.shape[0]//2:,:],axis=0)
        outImg =  np.dstack((binaryImg, binaryImg, binaryImg))
        midPoint = histogram.shape[0] // 2
        leftBase = np.argmax(histogram[:midPoint])
        rightBase = np.argmax(histogram[midPoint:]) + midPoint
        nwindows = 9
        windowHeight = np.int(binaryImg.shape[0]/nwindows)
        nonzero = binaryImg.nonzero()
        nonzeroy = np.array(nonzero[0])
        nonzerox = np.array(nonzero[1])
        leftCurrent = leftBase
        rightCurrent = rightBase
        margin = 70
        minpix = 55
        maxpix = 7000
        leftLaneInds = []
        rightLaneInds = []
        for window in range(nwindows):
            winYLow = binaryImg.shape[0] - (window + 1) * windowHeight
            winYHigh = binaryImg.shape[0] - window * windowHeight
            winXLeftLow = leftCurrent - margin
            winXLeftHigh = leftCurrent + margin
            winXRightLow = rightCurrent - margin
            winXRightHigh = rightCurrent + margin
            cv2.rectangle(outImg, (winXLeftLow, winYLow), (winXLeftHigh, winYHigh), (55,255,155), 5) #
            cv2.rectangle(outImg, (winXRightLow, winYLow), (winXRightHigh, winYHigh), (55,255,155), 5) #
            goodLeftInds = ((nonzeroy >= winYLow) & (nonzeroy < winYHigh) &
                            (nonzerox >= winXLeftLow) & (nonzerox < winXLeftHigh)).nonzero()[0] #
            goodRightInds = ((nonzeroy >= winYLow) & (nonzeroy < winYHigh) &
                            (nonzerox >= winXRightLow) & (nonzerox < winXRightHigh)).nonzero()[0] #
            leftLaneInds.append(goodLeftInds)
            rightLaneInds.append(goodRightInds)
            if(len(goodLeftInds) > minpix) & (len(goodLeftInds) < maxpix):
                leftCurrent = np.int(np.mean(nonzerox[goodLeftInds]))
            if(len(goodRightInds) > minpix) & (len(goodRightInds) < maxpix):
                rightCurrent = np.int(np.mean(nonzerox[goodRightInds]))
        leftLaneInds = np.concatenate(leftLaneInds)
        rightLaneInds = np.concatenate(rightLaneInds)

        leftx = nonzerox[leftLaneInds]
        lefty = nonzeroy[leftLaneInds]
        rightx = nonzerox[rightLaneInds]
        righty = nonzeroy[rightLaneInds]
        if(len(leftx) == 0 or len(lefty) == 0 or len(rightx) ==0 or len(righty) == 0):
            print("False")
        leftFit = np.polyfit(lefty, leftx, 2)
        rightFit = np.polyfit(righty, rightx, 2)
        ploty = np.array(range(0, binaryImg.shape[0], 1))
        leftFitx = leftFit[0] * ploty**2 + leftFit[1] * ploty + leftFit[2]
        rightFitx = rightFit[0] * ploty**2 + rightFit[1] * ploty + rightFit[2]

        outImg[nonzeroy[leftLaneInds], nonzerox[leftLaneInds]] = [255, 0, 0]
        outImg[nonzeroy[rightLaneInds], nonzerox[rightLaneInds]] = [0, 0, 255]
        outImg[ploty.astype(int), leftFitx.astype(int)] = [0, 255, 255]
        outImg[ploty.astype(int), rightFitx.astype(int)] = [0, 255, 255]
        return leftFit, rightFit, outImg

    def fitLinesContinuous(self, binaryWarped, leftFit, rightFit, nwindows = 9):
        nonzero = binaryWarped.nonzero()
        nonzeroy = np.array(nonzero[0])
        nonzerox = np.array(nonzero[1])
        margin = 80
        leftLaneInds = ((nonzerox > (leftFit[0] * (nonzeroy**2) + leftFit[1] * nonzeroy + leftFit[2] - margin)) &
                        (nonzerox < (leftFit[0] * (nonzeroy**2) + leftFit[1] * nonzeroy + leftFit[2] + margin)))
        rightLaneInds = ((nonzerox > (rightFit[0] * (nonzeroy**2) + rightFit[1] * nonzeroy + rightFit[2] - margin)) &
                        (nonzerox < (rightFit[0] * (nonzeroy**2) + rightFit[1] * nonzeroy + rightFit[2] + margin)))
        leftx = nonzerox[leftLaneInds]
        lefty = nonzeroy[leftLaneInds]
        rightx = nonzerox[rightLaneInds]
        righty = nonzeroy[rightLaneInds]
        if(len(leftx) == 0 or len(lefty) == 0 or len(rightx) ==0 or len(righty) == 0):
            return False, [], [], []
        leftFit = np.polyfit(lefty, leftx, 2)
        rightFit = np.polyfit(righty, rightx, 2)
        ploty = np.linspace(0, binaryWarped.shape[0]-1, binaryWarped.shape[0])
        leftFitx = leftFit[0] * (ploty**2) + leftFit[1] * ploty + leftFit[2]
        rightFitx = rightFit[0] * (ploty**2) + rightFit[1] * ploty + rightFit[2]
        outImg = np.dstack((binaryWarped, binaryWarped, binaryWarped))*255
        windowImg = np.zeros_like(outImg)
        outImg[nonzeroy[leftLaneInds], nonzerox[leftLaneInds]] = [255, 0, 0]
        outImg[nonzeroy[rightLaneInds], nonzerox[rightLaneInds]] = [0, 0, 255]
        leftLineWindow1 = np.array([np.transpose(np.vstack([leftFitx-margin,ploty]))])
        leftLineWindow2 = np.array([np.flipud(np.transpose(np.vstack([leftFitx+margin,ploty])))])
        leftLinePts = np.hstack((leftLineWindow1, leftLineWindow2))
        rightLineWindow1 = np.array([np.transpose(np.vstack([rightFitx-margin,ploty]))])
        rightLineWindow2 = np.array([np.flipud(np.transpose(np.vstack([rightFitx+margin,ploty])))])
        rightLinePts = np.hstack((rightLineWindow1, rightLineWindow2))
        return leftFit, rightFit, outImg

    def warpPerspectiveBack(self, img, warped, leftFit, rightFit):
        self.lane_vel(leftFit, rightFit, warped)
        warpZero = np.zeros_like(warped).astype(np.uint8)
        colorWarp = np.dstack((warpZero, warpZero, warpZero))
        ploty = np.linspace(0, img.shape[0]-1, num=img.shape[0])
        leftx = leftFit[0]*ploty**2+leftFit[1]*ploty+leftFit[2]
        rightx = rightFit[0]*ploty**2+rightFit[1]*ploty+rightFit[2]
        ptsLeft = np.array([np.transpose(np.vstack([leftx, ploty]))])
        ptsRight = np.array([np.flipud(np.transpose(np.vstack([rightx, ploty])))])
        pts = np.hstack((ptsLeft, ptsRight))
        cv2.fillPoly(colorWarp, np.int_([pts]), (0,255,0))
        newwarp = cv2.warpPerspective(colorWarp,self.invM,(img.shape[1], img.shape[0]))
        result = cv2.addWeighted(img, 1, newwarp, 0.3, 0)
        return result

if __name__ == '__main__':
    try:
        detector = laneDetector()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
