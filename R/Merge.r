gazebo<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\gazebo_robot_pose.csv",header=TRUE,sep="\t")
amcl<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\amcl_pose.csv",header=TRUE,sep="\t")
#Rename AMCL columns so the datasets have different var names. Merge wasn't working when tables had same col names
colnames(amcl)[colnames(amcl)=="X.meters."] <- "AMCL_X"
colnames(amcl)[colnames(amcl)=="Y.meters."] <- "AMCL_Y"
colnames(amcl)[colnames(amcl)=="Heading.Radians."] <- "AMCL_Heading"
colnames(gazebo)[colnames(gazebo)=="X.meters."] <- "Gazebo_X"
colnames(gazebo)[colnames(gazebo)=="Y.meters."] <- "Gazebo_Y"
colnames(gazebo)[colnames(gazebo)=="Heading.Radians."] <- "Gazebo_Heading"
#Merge
require(data.table) # v1.9.6+
#setDT(gazebo)[, val2 := setDT(amcl)[gazebo, val2, on = "Time", roll = "nearest"]]




#This one resulted in only exact matches in the Time table lining up, but the data columns were formatted 
#how I wanted.
gazebo_temp<-data.table(gazebo)
amcl_temp<-data.table(amcl)
setkey(amcl_temp,Time)
setkey(gazebo_temp, Time)
combined<-gazebo_temp[amcl_temp, roll="nearest"]


#This one worked!!  But need to whittle down to one observation for each timestep (duplicates)
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
ordered_data<-myfulldata[order(myfulldata$Time),]
final<-ordered_data[!duplicated(ordered_data$Time),]


#How to savea a CSV:
write.csv(file="C:\\users\\ebrenna8\\Desktop\\myfulldata.csv", x=myfulldata)
