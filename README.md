# GettingAndCleaningData-CourseProject

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

Data for this project can be downloaded through this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Files

CodeBook.md. describes the variables, the data, and the transformations performed to clean the data.

run_analysis.R contains all R coding for completing the course project.  This includes:
* Merging the training and the test sets to create one data set.
* Extracting only the measurements on the mean and standard deviation for each measurement. 
* Using descriptive activity names to name the activities in the data set
* Appropriately labeling the data set with descriptive variable names. 
* Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

averagedata.txt is a tidy data set with the average of each variable for each activity and each subject written out from run_analysis.R, 
