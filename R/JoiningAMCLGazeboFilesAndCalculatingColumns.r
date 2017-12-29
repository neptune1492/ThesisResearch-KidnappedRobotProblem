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
ordered_data<-myfulldata[order(myfulldata$Time),]
final<-ordered_data[!duplicated(ordered_data$Time),]


#Compare AMCL to Gazebo in each dimension
final$Delta_X<-abs(final$AMCL_X - final$Gazebo_X)
final$Delta_Y<-abs(final$AMCL_Y - final$Gazebo_Y)
final$Delta_Heading<-abs(final$AMCL_Heading - final$Gazebo_Heading)

#Multiply the differences, do a log so that the numbers aren't so tiny
final$Log_Of_Deltas_Multiplied = log(final$Delta_X * final$Delta_Y * final$Delta_Heading)


#Save as a CSV:
write.csv(file="C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\AMCLGazeboCombined.csv", x=final)
