#!/usr/bin/env python

import rospy
import time
import sys
import os
import math
import tf

from geometry_msgs.msg import Twist
from geometry_msgs.msg import PoseWithCovarianceStamped
from geometry_msgs.msg import Pose
from gazebo_msgs.msg import ModelState
from gazebo_msgs.srv import *

import sys,select, termios, tty




global current_x
current_x=0
global current_y
current_y=0
global current_qx
global current_qy
global current_qz
global current_qw

current_qx = 0
current_qy = 0
current_qz = 0
current_qw = 0

######################
def gms_client_set(model_name, relative_entity_name,x_pos,y_pos,z_pos,w_pos):
	rospy.wait_for_service('/gazebo/set_model_state')
	try:
		gms = rospy.ServiceProxy('/gazebo/set_model_state',SetModelState)
		model_state = ModelState()
		model_state.model_name = model_name
		model_state.reference_frame = relative_entity_name
		model_state.pose.position.x = float(x_pos)
		model_state.pose.position.y = float(y_pos)
		model_state.pose.position.z = float(z_pos)
		model_state.pose.orientation.z = float(w_pos)
		resp1 = gms(model_state)
		return resp1
	except rospy.ServiceException,e:
		print "Service call failed: %s" %e

def gms_client_get(model_name, relative_entity_name):
	rospy.wait_for_service('/gazebo/get_model_state')
	try:
		gms = rospy.ServiceProxy('/gazebo/get_model_state',GetModelState)
		resp = gms(model_name, relative_entity_name)
		return resp
	except Exception, e1:
		print e1
	except rospy.ServiceException,e:
		print "Service call Failed: %s" %e

def get_angle_diff(itt):
		
	global current_qx
	global current_qy
	global current_qz
	global current_qw

	
	#I returned to this program on 2/26/17, and 
	#found that these 3 lines were commented out. Why?

	#Answer: b/c code operates on AMCL callbacks now. Which means you 
	#have to start up Gazebo AND AMCL.
	#coord = gms_client_get("mobile_base","world")
	#current_x = coord.pose.position.x
	#current_y = coord.pose.position.y
	
	(current_x, current_y, current_qx, current_qy, current_qz, current_qw) = get_xy()
	#print 'Within getAngleDiff: Current x: ' + str(current_x)
	#print 'Within getAngleDiff: Current y: ' + str(current_y)

	#Determine the difference between the goal and current position
	delta_x = (coordinates[itt][0]- current_x)
	#print 'delta_x ' + str(delta_x)
	delta_y = (coordinates[itt][1] - current_y)
	#print 'delta_y' + str(delta_y)

	qx = current_qx #coord.pose.orientation.x
	qy = current_qy #coord.pose.orientation.y
	qz = current_qz #coord.pose.orientation.z
	qw = current_qw #coord.pose.orientation.w
	(xd, yd, current_dir) = tf.transformations.euler_from_quaternion([qx, qy, qz, qw])
	#Get the angle between current position and goal
	desired_dir = math.atan2(delta_y,delta_x)
#		print 'atan2 of delta_y and delta_x: ' + str(diff)
		
	while (desired_dir < -3.1415926):
		desired_dir = desired_dir + ( 2*3.1415926)
	while (desired_dir > 3.1415926):
		desired_dir = desired_dir - (2*3.1415926)

	diff = desired_dir - current_dir
	#Check for 0/2pi problem:
	if (diff > 3.1415926):
		diff = diff - (2*3.1415926)
	if (diff < -3.1415926):
		diff = diff + (2*3.1415926)
	#print 'Diff ' + str(diff) #some kind odf issue herewhen origin is startingpos
	return diff

def get_xy_gms():
	#Get current x/y coordinates	
	try:
		coord = gms_client_get("mobile_base","world")
		#print 'superstitious'
		#print coord
		
		current_x = coord.pose.position.x
		current_y = coord.pose.position.y
	
	except Exception, e:
		print 'error in get_xy: ' + str(e)
	

	return current_x, current_y



def poseCallback(amcl_pose):
	#print 'WITHIN POSECALLBACK CALLBACK METHOD'
	
	global current_x
	global current_y
	global current_qx
	global current_qy
	global current_qz
	global current_qw

	current_x = amcl_pose.pose.pose.position.x
	current_y = amcl_pose.pose.pose.position.y
	current_qx = amcl_pose.pose.pose.orientation.x
	current_qy = amcl_pose.pose.pose.orientation.y
	current_qz = amcl_pose.pose.pose.orientation.z
	current_qw = amcl_pose.pose.pose.orientation.w

	#print 'Within callback: CURRENT_X: ' + str(current_x)
	
	#print 'Within callback: CURRENT_Y: ' + str(current_y)
	#print 'Within callback: Current theta: ' + str(current_qy)
	return
	
def get_xy():
	#print 'Get_xy() has been called.'
	global current_x
	global current_y
	global current_qx
	global current_qy
	global current_qz
	global current_qw

	#using amcl_pose message
	#while (current_x==0 and current_y==0):
	#	print 'waiting for nonzero current_x and current_y'
	#print 'current_x and current_y have been assigned!'
	#print str(current_x) + " " + str(current_y)
	return current_x, current_y, current_qx, current_qy, current_qz, current_qw
#########################

if __name__=="__main__":

	settings = termios.tcgetattr(sys.stdin)
	rospy.init_node('turtlebot_teleop')
	pub = rospy.Publisher('~cmd_vel',Twist,queue_size=5)
	pub2 = rospy.Publisher('GazeboPose',Pose, queue_size=5)
	rospy.Subscriber("/amcl_pose", PoseWithCovarianceStamped, poseCallback)	

	print 'Time\tGazebo_x(meters)\tGazebo_y(meters)\tGazebo_heading(radians)\tAMCL_x(meters)\tAMCL_y(meters)\tAMCL_heading(radians)'

	while(True == True):

		(x, y, qx, qy, qz, qw) = get_xy()

		coord = gms_client_get("mobile_base","world")
		now = rospy.Time.now()

		(xd, yd, current_dir_gazebo) = tf.transformations.euler_from_quaternion([coord.pose.orientation.x, coord.pose.orientation.y, coord.pose.orientation.z, coord.pose.orientation.w])

		(xd, yd, current_dir_amcl) = tf.transformations.euler_from_quaternion([qx, qy, qz, qw])
		print str(now.secs) +"." + str(now.nsecs) + "\t" + str(coord.pose.position.x) + "\t" + str(coord.pose.position.y) + "\t" + str(current_dir_gazebo) + "\t" + str(x) + "\t" + str(y) + "\t" + str(current_dir_amcl)


