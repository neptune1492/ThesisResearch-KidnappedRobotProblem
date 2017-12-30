#!/bin/bash

clear
rosbag play /home/ebrenna8/Turtlebot_World_Driving.bag
rosnode kill -a
killall -9 gzserver
