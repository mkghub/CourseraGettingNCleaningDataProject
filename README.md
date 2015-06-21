Getting and Cleaning Data: Course Project
Introduction
This repository is for the course project of "Getting and Cleaning data", available in Coursera. 
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
The data and the script
The original dataset being used is: Human Activity Recognition Using Smartphones. 
Here are the original data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The tidy data contained in the file 'averages_data.txt' has been obtained by the following steps.
1. Merges the training and the test sets to create one data set. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 3. Uses descriptive activity names to name the activities in the data set 4. Appropriately labels the data set with descriptive activity names. 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

?The corresponding R-script is run_analysis.R. The code assumes tha the Samsung data is in the same working directory.


The Code Book
For the description of the variables, please confer the file CodeBook.md.

