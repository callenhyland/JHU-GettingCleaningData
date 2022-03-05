# JHU Getting and Cleaning Data Course Project
# Created by Callen Hyland, March 2, 2022

# This project analyzes data collected from accelerometers 
# in Samsung Galaxy smartphones while test subjects were performing 
# a variety of activities. 

# Script below does the following:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

# library imports
library(tidyverse)
library(data.table)

# Read test and training data sets
X.test <- fread("./UCI HAR Dataset/test/X_test.txt")
X.train <- fread("./UCI HAR Dataset/train/X_train.txt")

## ADD DESCRIPTIVE VARIABLE NAMES
features <- fread("./UCI HAR Dataset/features.txt")
colnames(X.test) <- features$V2
colnames(X.train) <- features$V2

# Create new column for subject label
test.subject <- fread("./UCI HAR Dataset/test/subject_test.txt")
X.test$subject <- test.subject$V1
train.subject <- fread("./UCI HAR Dataset/train/subject_train.txt")
X.train$subject <- train.subject$V1

# Create new column for activity labels
test.label <- fread("./UCI HAR Dataset/test/y_test.txt")
X.test$label <- test.label$V1
train.label <- fread("./UCI HAR Dataset/train/y_train.txt")
X.train$label <- train.label$V1

## MERGE TEST AND TRAINING DATASETS
X.comb <- bind_rows(X.train, X.test)

# Remove original variables
rm(features, test.subject, train.subject, 
   train.label, test.label, X.test, X.train)


## ADD DESCRIPTIVE ACTIVITY LABELS

# Load descriptive labels file
lab <- fread("./UCI HAR Dataset/activity_labels.txt")

# Assign descriptive label in place of number
X.comb$label <- factor(as.character(X.comb$label), lab$V1, lab$V2)
rm(lab)


## EXTRACT ONLY MEAN AND STANDARD DEVIATION MEASUREMENTS
# refer to "./UCI HAR Dataset/features_info.txt"

X.comb <- select(X.comb, subject, label, 
                 contains("mean()"), contains("std()"))


## CREATE NEW TIDY DATASET WITH JUST MEANS, FOR EACH VARIABLE/SUBJECT COMBINATION

# Convert to tibble to use group_by function
X.comb <- tibble::as_tibble(X.comb)

# Group X.comb by subject and label
by.sub.lab <- group_by(X.comb, subject, label)
#summarize(by.sub.lab)

# Calculate mean of all variables for each group and write table
means.sub.lab <- summarize_all(by.sub.lab, list(mean))

# Save tidy data set as text file
write.table(means.sub.lab, "tidy_table_output.txt", row.name = FALSE)
