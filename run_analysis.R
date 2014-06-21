##This dataset is constructed using data from the University of California, Irvine
##Machine Learning Repository (UCI MRL, 2012).  The source link is"
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##The project is described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##See the corresponding project CodeBook and README file for more information.

##This assumes all files are extracted into the current working directory.

library(plyr)
library(reshape2)

#Combine training and test data sets
traindata<-read.table("train/X_train.txt") #Reads measurements for train set (7352 row x 561 col)
testdata<-read.table("test/X_test.txt") #Reads measurements for test set (2947 row x 561 col)
measdata<-rbind(traindata,testdata) #Combines measurements into one table (10299 row x 561 col)

#Add feature names as names for columns in dataset
features<-read.table("features.txt") #Index and list of all features (561 row x 2 col)
names(features)<-c("Index","Feature") #Add names to columns
featvect<-features[,"Feature"] #Make a vector of just the Features names column
featvect<-gsub("tBody", "Time.Body.", featvect, ignore.case = FALSE)
featvect<-gsub("tGravity", "Time.Gravity.", featvect, ignore.case = FALSE)
featvect<-gsub("fBody", "Freq.Body.", featvect, ignore.case = FALSE)
featvect<-gsub("Gyro", "Gyroscope-", featvect, ignore.case = FALSE)
featvect<-gsub("Acc", "Accelerometer-", featvect, ignore.case = FALSE)
featvect<-gsub("--", "-", featvect, ignore.case = FALSE)
names(measdata)<-featvect  #Add features as names to columns (10299 row x 561 column + headers)

#Extract only Mean and SD measurements
subsetData<-measdata[,grep(("mean|std"),colnames(measdata))] #Extract mean and std columns
subsetData<-subsetData[,-grep("meanFreq",colnames(subsetData))] # remove mean freq columns (10299 row x 66 col)

#Combine training and test activity label files
acttrain<-read.table("train/y_train.txt") #List of activity indexes for training set (7352 row x 1 col)
acttest<-read.table("test/y_test.txt") #List of activity indexes for test set (2947 row x 1 col)
actdata<-rbind(acttrain,acttest) #Combines activity lists into one list (10299 row x 1 col)
names(actdata)<-c("ActivityIndex") #Assigns name ActivityIndex to column


#Combine subject IDS for training and test sets
sbjtrain<-read.table("train/subject_train.txt") #List of subject IDs for measurements for training set (7352 row x 1 col)
sbjtest<-read.table("test/subject_test.txt") #List of subject IDs for measurements for test set (2947 row x 1 col)
sbjdata<-rbind(sbjtrain,sbjtest) #Combines subject IDs into one list (10299 row x 1 col)
names(sbjdata)<-c("SubjectID") #Assigns name SubjectID to column

#Append ActivityIndex and SubjectID to dataset
subsetData<-cbind(actdata,subsetData) #(10299 row x 67 col)
subsetData<-cbind(sbjdata,subsetData) #(10299 row x 68 col)

#Add Activity names to data set matched with Activity Indices
actname<-read.table("activity_labels.txt") #Links activity index with name (6 row x 2 col)
names(actname)<-c("ActivityIndex","ActivityName") #Assigns names to columns
finalData=merge(subsetData,actname,by.x="ActivityIndex",by.y="ActivityIndex",all=TRUE) #(10299 row x 69 col)

#Delete "BodyBody" variables
finalData<-finalData[,-grep("Body.Body",colnames(finalData))] # remove "BodyBody" columns (10299 row x 63 col)

#Save Tidy Data set #1 to file
write.csv(finalData, file = "Smartphone_inertial_sensors.csv", row.names = FALSE)

#Create new dataframe with average of each variable by activity and subject
Averages <- ddply(melt(finalData, id.vars=c("SubjectID", "ActivityName")), .(SubjectID, ActivityName), summarise, Means=mean(value))


#Save Tidy Data set #2 to file
write.table(Averages, file = "Activity_means.csv", row.names = FALSE)




