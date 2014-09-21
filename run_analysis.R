
# set the working Directory to the location where the downloaded and extracted files are available
setwd("D:/WDforRstudio/CDProject/UCI HAR Dataset")

# Read all necessary data into tables
x_train<-read.table("./train/X_train.txt")
y_train<-read.table("./train/y_train.txt")
x_test<-read.table("./test/x_test.txt")
y_test<-read.table("./test/y_test.txt")
sub_test<-read.table("./test/subject_test.txt")
sub_train<-read.table("./test/subject_train.txt")
feature<-read.table("./features.txt")
activity<-read.table("./activity_labels.txt")
# Step 1 : Merges the training and the test sets to create one data set.
# Combine the tables using the information available

# test Data
data_test<-cbind(x_test,sub_test,y_test)
# training data
data_train<-cbind(x_train,sub_train,y_train)
# Combinging test and training data
dataset<-rbind(data_test,data_train)
# yields data frame with 563 variables

#Setting col names part of Step 3
colnames(dataset)<-feature$V2

# Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement. 
# create a filter to get colums with mean() and std() in their names
z<-grepl("*mean\\(\\)",feature$V2)|grepl("*std\\(\\)",feature$V2)
filter<-feature[z,1]

filter<-c(filter,562,563)
datasetfiltered<-dataset[,filter]
# Step 3 : Uses descriptive activity names to name the activities in the data set
# Step 4 : Appropriately labels the data set with descriptive variable names. 
# naming the subject and Acitivity columns
colnames(datasetfiltered)[67]<-"Subject"
colnames(datasetfiltered)[68]<-"Activity"

datasetfiltered$Activity<-factor(datasetfiltered$Activity,levels=activity$V1,labels=activity$V2)
# alternative approach
#datasetfiltered<-merge(datasetfiltered,activity,by.x="Activity",by.y="V1")
#datasetfiltered$ActivityID<-NULL

# step 5 : From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

# melting by declaring Activity and Subkect as ID variables
meltds<-melt(datasetfiltered,id.vars=c("Activity","Subject"))


# getting mean of all variables per each activity and each subject
# 6 activities and 30 subjects 180 observations. with 68 variables
tidyds<-dcast(meltds,Activity + Subject ~ variable, mean)