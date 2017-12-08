#!/bin/bash
#source /home/pi/.bashrc
sleep 20 
export LC_ALL="C"

export ROS_IP=192.168.2.216
export ROS_MASTER_URI=http://main-controller:11311

source /opt/ros/indigo/setup.bash
source /home/pi/catkin_ws/devel/setup.bash

roslaunch turtlebot_radio_bringup multimaster.launch &
sleep 10 
roslaunch radio_node_manager_main_controller manager.launch &
rosrun radio_home_configuration run_configuration.py &
rosrun radio_report_generator report_generator.py &
roslaunch snc_sensors_publisher snc_sensors.launch &
roslaunch snc_events_wrapper wrapper.launch &
roslaunch ros_visual_wrapper wrapper.launch &
roslaunch hpr_wrapper wrapper.launch &
roslaunch motion_analysis_wrapper wrapper.launch &
roslaunch room_status_publisher status.launch &
