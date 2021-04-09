
#include "ros/ros.h"
#include "geometry_msgs/Twist.h"

int main(int argc, char **argv) {
    ros::init(argc, argv, "test");
    ros::NodeHandle n;
    ros::Rate loop_rate(10);
    ros::Publisher velPub = n.advertise<geometry_msgs::Twist>("/cmd_vel", 100);
    geometry_msgs::Twist msg;
    for (int i = 0; i < 100; i++) {
    msg.linear.x = 3.0;
    msg.linear.y = 3.0;
    msg.linear.z = 0.0;
    velPub.publish(msg);
    }
    ROS_INFO("Published msg");
    ros::spin();
    return 0;
}

