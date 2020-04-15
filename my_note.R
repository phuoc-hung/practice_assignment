#Page 1
unzip("diet_data.zip", exdir = "diet_data")
list.files("diet_data")
andy<-read.csv("diet_data/Andy.csv")
head(andy)
length(andy$Day)
dim(andy)
str(andy)
summary(andy)
names(andy)
andy[1,"Weight"]
andy[30,"Weight"]
andy[which(andy$Day==30), "Weight"]
andy[which(andy[,"Day"]==30),"Weight"]
subset(andy,Day==30, select = Weight)
subset(andy$Weight,andy$Day==30)
and_start<-andy[1,"Weight"]
and_end<-andy[30,"Weight"]
andy_lost<-and_start - and_end
andy_lost
files<-list.files("diet_data")
files           
files[1]
files[1:3]
head(read.csv(files[3])) ## Errors because there is no file named "John.csvin wd.
files_full<-list.files("diet_data", full.names = TRUE)
files_full
head(read.csv(files_full[3]))
andy_david<-rbind(andy,read.csv(files_full[2]))
andy_david
head(andy_david)
tail(andy_david)
day_25<-andy_david[which(andy_david$Day==25),]
day_25
## Page 5 - continue