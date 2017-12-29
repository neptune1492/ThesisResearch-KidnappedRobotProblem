mytable<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Normal\\1\\cloud_weight.csv",header=TRUE,sep="\t")
values<-data.frame(mytable) 
normal<-aggregate(x=values, by=list(unique.values=values$Time), FUN=max)

mytable<-read.csv("C:\\Users\\ebrenna8\\Documents\\Data Files\\11-27-17\\NovemberDataCollection\\Major\\1\\cloud_weight.csv",header=TRUE,sep="\t")
values<-data.frame(mytable) 
major<-aggregate(x=values, by=list(unique.values=values$Time), FUN=max)
