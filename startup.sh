#!/bin/bash
#source /home/pi/.bashrc
sleep 20 
export LC_ALL="C"

export ROS_IP=172.21.13.111
export ROS_MASTER_URI=http://main-controller:11311

source /opt/ros/indigo/setup.bash
source /home/pi/catkin_ws/devel/setup.bash

roslaunch turtlebot_radio_bringup multimaster.launch &
sleep 10 
roslaunch radio_node_manager_main_controller manager.launch &
rosrun radio_home_configuration run_configuration.py &
rosrun radio_report_generator report_generator.py &
