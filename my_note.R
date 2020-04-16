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
#Create general data frame from particular ones 
dat<-data.frame() # Create empty data frame
for (i in 1:5){
  dat<-rbind(dat,read.csv(files_full[i]))
}
str(dat)
#Calculate the mean of Weight in a certain day
median(dat$Weight, na.rm = TRUE)
dat_30<-dat[which(dat$Day==30),]
dat_30
median(dat_30$Age)

#Creat function to calculate the means of rows
weightmedian<-function(directory,day)
  {
  files_list<- list.files(directory, full.names = TRUE)
  dat<-data.frame()
  for (i in 1:5){
    dat<-rbind(dat,read.csv(files_list[i]))
    
  }
  dat_subset<-dat[which(dat$Day==day),]
  median(dat_subset[,"Weight"], na.rm = TRUE)
}
weightmedian("diet_data", 30)
weightmedian("diet_data", 17)


# Cách tạo Object rỗng

tmp<-vector(mode = "list",length=length(files_full)) #Create a empty list
summary(tmp)
#Creat a list including many data frame
for( i in seq_along(files_full)) {
  tmp[[i]]<-read.csv(files_full[[i]])
}
str(tmp)
str(lapply(files_full,read.csv)) # An existed function to do the <<same job>>!!
tmp
#use a function called do.call() to combine tmp into a single data frame
output<- do.call(rbind, tmp)
str(output)


