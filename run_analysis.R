#######################################################################
#######################################################################
#
# GETTING AND CLEANING DATA FINAL COURSE PROJECT
#
#######################################################################
#######################################################################

# Set working directory
setwd("C:/Users/andersmi/Desktop/Coursera HW/UCI HAR Dataset")

# Load libraries
library(tidyverse)

#######################################################################
# 1. Merge the training and test sets to create one data set
#######################################################################

# Read in feature and activity data
feature <- read.table("features.txt", col.names=c("FID", "Feature"))
activity <- read.table("activity_labels.txt", col.names=c("ActivityCode", "ActivityName"))

# Read in test data
test_subject <- read.table("test/subject_test.txt", col.names=c("Subject"))
test_x <- read.table("test/X_test.txt", col.names=feature$Feature)
test_y <- read.table("test/Y_test.txt", col.names=c("ActivityCode"))

# Read in training data
train_subject <- read.table("train/subject_train.txt", col.names=c("Subject"))
train_x <- read.table("train/X_train.txt", col.names=feature$Feature)
train_y <- read.table("train/Y_train.txt", col.names=c("ActivityCode"))

# Merge all data sets to create a single data set
subject <- rbind(test_subject, train_subject)
x <- rbind(test_x, train_x)
y <- rbind(test_y, train_y)
data <- cbind(subject, x, y)
View(data)

#######################################################################
# 2. Extract only the measurements on the mean and standard 
#    deviation for each measurement 
#######################################################################

# Select subject, activity code, and feature columns that include mean or std
tidydata <- data %>% select(Subject, ActivityCode, contains("mean"), contains("std"))

#######################################################################
# 3. Use descriptive activity names to name the activities 
#######################################################################

# Add activity name to tidy data set and re-sort columns
tidydata <- merge(tidydata, activity, by="ActivityCode")
tidydata <- tidydata %>% select(Subject, ActivityCode, ActivityName, contains("mean"), contains("std"))

#######################################################################
# 4. Appropriately label the data set with descriptive variable names 
#######################################################################

# Rename variables with descriptive variable names
names(tidydata)<-gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-std()", "STD", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("^t", "Time", names(tidydata))
names(tidydata)<-gsub("^f", "Frequency", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))
names(tidydata)<-gsub("tBody", "TimeBody", names(tidydata))

#######################################################################
# 5. create a second, independent tidy data set with the average 
#    of each variable for each activity and each subject
#######################################################################

# Mean of each feature for each subject and activity
means <- tidydata %>% group_by(Subject, ActivityName) %>% summarize_all(mean, na.rm=TRUE)

# Write a new data set with the means of each feature for each subject and activity
write.txt(means, "Activity Summary Data.txt")
write.csv(means, "Activity Summary Data.csv")
