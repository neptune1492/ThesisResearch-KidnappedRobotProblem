#1
#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\amcl_gazebo_poses_joined.csv", x=final)

#2

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\2\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\2\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\2\\amcl_gazebo_poses_joined.csv", x=final)

#3

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\3\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\3\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\3\\amcl_gazebo_poses_joined.csv", x=final)

#4

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\4\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\4\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\4\\amcl_gazebo_poses_joined.csv", x=final)

#5

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\5\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\5\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\5\\amcl_gazebo_poses_joined.csv", x=final)

#6

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\6\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\6\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\6\\amcl_gazebo_poses_joined.csv", x=final)

#7

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\7\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\7\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\7\\amcl_gazebo_poses_joined.csv", x=final)

#8
#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\8\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\8\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\8\\amcl_gazebo_poses_joined.csv", x=final)

#9

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\9\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\9\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\9\\amcl_gazebo_poses_joined.csv", x=final)

#10


#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\10\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\10\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\10\\amcl_gazebo_poses_joined.csv", x=final)

#Major
#1

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\1\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\1\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\1\\amcl_gazebo_poses_joined.csv", x=final)

#2

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\2\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\2\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\2\\amcl_gazebo_poses_joined.csv", x=final)

#3

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\3\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\3\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\3\\amcl_gazebo_poses_joined.csv", x=final)

#4

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\4\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\4\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\4\\amcl_gazebo_poses_joined.csv", x=final)

#5

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\5\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\5\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\5\\amcl_gazebo_poses_joined.csv", x=final)

#6

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\6\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\6\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\6\\amcl_gazebo_poses_joined.csv", x=final)

#7

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\7\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\7\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\7\\amcl_gazebo_poses_joined.csv", x=final)

#8

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\8\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\8\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\8\\amcl_gazebo_poses_joined.csv", x=final)

#9

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\9\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\9\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\9\\amcl_gazebo_poses_joined.csv", x=final)

#10

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\10\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\10\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\10\\amcl_gazebo_poses_joined.csv", x=final)

#11

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\11\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\11\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)
#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\11\\amcl_gazebo_poses_joined.csv", x=final)

#12

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\12\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\12\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\12\\amcl_gazebo_poses_joined.csv", x=final)

#13

#This script joins the Gazebo data to each timestep of the AMCL dataset
gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\13\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\13\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"

myfulldata<-merge(amcl,gazebo)	#This grabbed all the Gazebo data for each AMCL timestep

#Grabbing the first one for each timestep:
ordered_data<-myfulldata[order(myfulldata$Time),] #sort
final<-ordered_data[!duplicated(ordered_data$Time),] #grab first
#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)
final$XYDistFormula<-(final$AMCL_X - final$Gazebo_X)**2 + (final$AMCL_Y - final$Gazebo_Y)**2
#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)
final$Log_Of_XYDist_x_Delta_Heading<-log(final$XYDistFormula * final$Delta_Heading)

#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\13\\amcl_gazebo_poses_joined.csv", x=final)


