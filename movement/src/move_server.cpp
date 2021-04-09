#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>
#include <movement/MoveAction.h>
#include <cmath>
#include <cstdlib>
#include "localization/Uwb.h"
#include "geometry_msgs/Twist.h"

typedef actionlib::SimpleActionServer<movement::MoveAction> Server;

class MoveAction {
protected:
    ros::NodeHandle nh_;
    actionlib::SimpleActionServer<movement::MoveAction> as_;
    std::string action_name_;
    movement::MoveFeedback feedback_;
    movement::MoveResult result_;
    float angle_origin, x_origin, y_origin;
    float angle;

public:
    explicit MoveAction(const std::string &name) :
            as_(nh_, name, boost::bind(&MoveAction::executeCB, this, _1), false),
            action_name_(name) {
        as_.start();
    }

    void uwbCallback(const localization::Uwb::ConstPtr &msg) {
        feedback_.x = msg.get()->pos[0];
        feedback_.y = msg.get()->pos[1];
        angle = msg.get()->angle;
        if (angle_origin > 500) {
            angle_origin = angle;
        }
        if (x_origin > 500) {
            x_origin = feedback_.x;
        }
        if (y_origin > 500) {
            y_origin = feedback_.y;
        }
    }

    void executeCB(const movement::MoveGoalConstPtr &goal) {
        angle_origin = 1000;
        x_origin = 1000;
        y_origin = 1000;

        bool success = true;
        float goalx = goal.get()->x, goaly = goal.get()->y;
        float speed = 0.1;
        ROS_INFO("Trying to move (%.3f, %.3f).", goalx, goaly);
        bool go_x = std::fabs(goalx) > 0.05, go_y = std::fabs(goaly) > 0.05;
        if (go_x && go_y) {
            as_.setAborted(movement::MoveResult{}, "only support unidirection movement!");
            return;
        } else if (go_x < -0.05 || go_y < -0.05) {
            speed = -speed;
        }

        ros::Subscriber subscriber = nh_.subscribe("uwb", 100, &MoveAction::uwbCallback, this);
        ros::Publisher publisher = nh_.advertise<geometry_msgs::Twist>("cmd/vel", 100);
        // start executing the action
        ros::Rate r(20);
        while (true) {
            if (as_.isPreemptRequested() || !ros::ok()) {
                ROS_INFO("%s: Preempted", action_name_.c_str());
                // set the action state to preempted
                as_.setPreempted();
                success = false;
                break;
            }
            geometry_msgs::Twist twist;
            if (go_x) {
                twist.linear.x = speed;
                twist.linear.y = (y_origin - feedback_.y) * 2;
            } else {
                twist.linear.y = speed;
                twist.linear.x = (x_origin - feedback_.x) * 2;
            }
            twist.linear.z = 0;
            twist.angular.z = angle_origin - angle;
            publisher.publish(twist);
            as_.publishFeedback(feedback_);
            if (fabs(feedback_.x - goalx) < 0.04 && fabs(feedback_.y - goaly) < 0.04) {
                break;
            }
            r.sleep();
        }

        result_.x = feedback_.x;
        result_.y = feedback_.y;
        if (success) {
            result_.x = feedback_.x;
            result_.y = feedback_.y;
            ROS_INFO("%s: Succeeded", action_name_.c_str());
            // set the action state to succeeded
            as_.setSucceeded(result_);
        } else {
            as_.setAborted(result_, "only support unidirection movement!");
        }
        geometry_msgs::Twist zero;
        publisher.publish(zero);
    }
};

int main(int argc, char **argv) {
    ros::init(argc, argv, "move_server");
    ros::NodeHandle n;
    MoveAction moveAction("move");
    Server server(n, "move", boost::bind(&MoveAction::executeCB,  &moveAction, _1), false);
    server.start();
    ros::spin();
    return 0;
}
