#!/bin/bash

clear
if [ $# -eq 0 ]
then
echo "No Name for the Bag was Supplied."
exit
fi

echo "Recording ROS topics to ..."
echo $1
rosbag record -O $1 /cluster_count /delta_pose /filter_covariance /max_weight_hyp /numsamples /particlecloud /test_pub /amcl_pose /cloud_weight /particlecloudPreResample /odom /cmd_vel_mux/input/teleop /gazebo_robot_pose
