import rosbag
import os
import sys
import math
import tf

from tf.transformations import euler_from_quaternion



def get_amcl_pose_covariance(f, out_file, topic_name):
	
	out_file.write('Time\tCovariance0\tCovariance1\tCovariance2\tCovariance3\tCovariance4\tCovarianace5\tCovariance6\n')
	for topic, msg,t in f.read_messages(topics = [topic_name]):
	
		out_file.write(str(int(str(t))/1000000000) + "." + str(int(str(t))%1000000000) + "\t")
		for element in msg.pose.covariance:
			out_file.write(str(element) + '\t')
		out_file.write('\n')



def get_array(f, out_file, topic_name):
	out_file.write('Time\tParticleNumber\tParticleWeight\n')

	for topic, msg, t in f.read_messages(topics=[topic_name]):
		counter=0
		for element in msg.cov:
			#Timestamp
			out_file.write(str(int(str(t))/1000000000) + "." + str(int(str(t))%1000000000) + "\t")
			out_file.write(str(counter) + "\t" + str(element) + "\n")
			counter=counter+1

	


def get_topic_pose(f, out_file, topic_name):
	
	out_file.write('Time\tX(meters)\tY(meters)\tHeading(Radians)\n')
	for topic, msg,t in f.read_messages(topics = [topic_name]):
	
		out_file.write(str(int(str(t))/1000000000) + "." + str(int(str(t))%1000000000) + "\t")
		x = msg.pose.pose.position.x
		y = msg.pose.pose.position.y
		quat = (
			msg.pose.pose.orientation.x,
			msg.pose.pose.orientation.y,
			msg.pose.pose.orientation.z,
			msg.pose.pose.orientation.w)
		yaw = tf.transformations.euler_from_quaternion(quat)[2]
		out_file.write(str(x) + "\t" + str(y) + '\t' + str(yaw) + "\n")




def get_particle_cloud(f, out_file, topic_name):
	out_file.write('Time\tElement\tX(meters)\tY(meters)\tHeading(Radians)')
	#for topic, msg, t in f.read_messages(topics = ['/particlecloud']):

	for topic, msg, t in f.read_messages(topics = [topic_name]):
		counter = 0
		particle_cloud_seq= msg.header.seq

		#get the associated value of the amcl_pose - i.e., the position estimate according to AMCL


		for element in msg.poses:
			#Timestamp:
			out_file.write(str(int(str(t))/1000000000) + "." + str(int(str(t))%1000000000) + "\t")

			x=element.position.x
			y=element.position.y
			qx =element.orientation.x
			qy = element.orientation.y
			qz = element.orientation.z
			qw = element.orientation.w


			#Dumb quaternion math:
			#XX = qx * qx
			#XZ = qx * qz
			#XW = qx * qw
			#YY = qy * qy
			#YW = qy * qw
			#YZ = qy * qz
			#ZZ = qz * qz
			#yaw = math.atan2(2 * YW - 2 * XZ, 1-2*YY-2*ZZ)
			quaternion = (
			    qx,
			    qy,
			    qz,
			    qw)

			euler = tf.transformations.euler_from_quaternion(quaternion)
			#print euler[2]
			out_file.write(str(counter) + "\t" + str(x) + "\t" + str(y) + "\t" + str(euler[2]) + "\n") # + "\t" + str(qx) + "\t" + str(qy) + "\t" + str(qz) + "\t" + str(qw) + "\t" + str(amcl_x) + "\t" + str(amcl_y) + "\t" + str(amcl_yaw) + "\n")
			counter = counter + 1 #increment counter

	return

	
if __name__=="__main__":
	if len(sys.argv) == 3:
		print 'Enough arguments were supplied'
	else:
		print 'NOT ENOUGH ARGUMENTS SUPPLIED. NEED BAG NAME AND OUTPUT FILE DIRECTORY'
		sys.exit()


	bag_file =sys.argv[1]
	print 'Opening: '
	print bag_file
	out_file_path = sys.argv[2]
	print 'Saving to...'
	print out_file_path

	f=rosbag.Bag(bag_file)
	#topics = f.get_type_and_topic_info()[1].keys()
	#print 'Topics: \n'
	#print topics
	#for i in range(0, len(f.get_type_and_topic_info()[1].values())):
	#	print f.get_type_and_topic_info()[1].values()[i][0]
	

	#The idea here is to go through each of the important topics and print them out to their own CSV

	#Particle Cloud - post-resample
	outFile = open(out_file_path+'particlecloud.csv', 'w')
	print 'Path:'
	print outFile
	get_particle_cloud(f, outFile, '/particlecloud')
	outFile.close()



	#Particle Cloud - pre-resample
	outFile = open(out_file_path+'particlecloudPreResample.csv', 'w')
	print 'Path:'
	print outFile
	get_particle_cloud(f, outFile, '/particlecloudPreResample')
	outFile.close()


	#AMCL
	outFile = open(out_file_path+'amcl_pose.csv', 'w')
	print 'Path:'
	print outFile
	get_topic_pose(f, outFile, '/amcl_pose')
	outFile.close()


	#Gazebo Pose
	outFile = open(out_file_path+'gazebo_robot_pose.csv', 'w')
	print 'Path:'
	print outFile
	get_topic_pose(f, outFile, '/gazebo_robot_pose')
	outFile.close()


	#Gazebo Pose
	outFile = open(out_file_path+'cloud_weight.csv', 'w')
	print 'Path:'
	print outFile
	get_array(f, outFile, '/cloud_weight')
	

	#AMCL Covariancee
	outFile = open(out_file_path+'amcl_covariance.csv', 'w')
	print 'Path:'
	print outFile
	get_amcl_pose_covariance(f, outFile, '/amcl_pose')
	



	print 'Finished'
