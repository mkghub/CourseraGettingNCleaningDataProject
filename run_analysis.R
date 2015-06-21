#setwd("D:/users/Dropbox/ML/Getting_Cleaning_Data/Project/UCI HAR Dataset")

library(plyr)

# Read the data
dtActivityTest <- read.table("./test/y_test.txt",header=FALSE)
dtActivityTrain <- read.table("./train/y_train.txt",header=FALSE)
dtSubjectTest <- read.table("./test/subject_test.txt",header=FALSE)
dtSubjectTrain <- read.table("./train/subject_train.txt",header=FALSE)
dtFeaturesTest <- read.table("./test/X_test.txt",header=FALSE)
dtFeaturesTrain <- read.table("./train/X_train.txt",header=FALSE)

#1 Merges the training and the test sets to create one data set.
dtSubject <- rbind(dtSubjectTrain,dtSubjectTest)
dtActivity <- rbind(dtActivityTrain,dtActivityTest)
dtFeatures <- rbind(dtFeaturesTrain,dtFeaturesTest)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
 # Set Column names
names(dtSubject) <- c("subject")
names(dtActivity) <- c("activity")
dtFeatureNames <- read.table("features.txt",header=FALSE)
names(dtFeatures) <- dtFeatureNames$V2

 # Combine data
dtSubjectActivity <- cbind(dtSubject,dtActivity)
dtAll <- cbind(dtFeatures,dtSubjectActivity)

 # Select only the measurements on the mean and standard deviation for each measurement
names_Mean_Std <- dtFeatureNames$V2[grep("-(mean|std)\\(\\)", dtFeatureNames$V2)]
names_sub <- c(as.character(names_Mean_Std),"subject","activity")
dtSubset <- subset(dtAll,select=names_sub)

#3 Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("activity_labels.txt",header=FALSE)
dtSubset$activity <- activityLabels[dtSubset$activity,2]

#4 Appropriately labels the data set with descriptive variable names
names(dtSubset) <- gsub("^t","time", names(dtSubset))
names(dtSubset) <- gsub("^f","frequency", names(dtSubset))
names(dtSubset) <- gsub("Acc","Accelerometer", names(dtSubset))
names(dtSubset) <- gsub("Gyro","Gyroscope", names(dtSubset))
names(dtSubset) <- gsub("Mag","Magnitude", names(dtSubset))
names(dtSubset) <- gsub("BodyBody","Body", names(dtSubset))

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
averages_data <- ddply(dtSubset, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)








