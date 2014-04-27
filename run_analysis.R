## The following is code that does the following:
## 1. Merges the training and test sets to one data set
## 2. Extracts only the measurements on the mean and the standard deviation
## for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each
## activity and each subject.

## Assumes that all data is within the "UCI HAR Dataset" directory, within the
## current working directory

## For an overview, please review the ReadMe.MD file
## For a more detailed description of variables and processes, please go to the
## codebook.txt file

## Load libraries (assumes already installed)
library(reshape2)

## Load all data into local variables

## Overall data variables

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Test data variables

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Training data variables

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## 1. Merge data variables

test_consolidate <- data.frame(data.frame(subject_test,y_test),X_test)
train_consolidate <- data.frame(data.frame(subject_train,y_train),X_train)
cons_merge_temp_1 <- merge(test_consolidate,train_consolidate,all=TRUE)
cons_merge_temp_2 <- merge(activity_labels,cons_merge_temp_1,by.x="V1", by.y="V1.1",
                    all=FALSE)
cons_merge <- cons_merge_temp_2[,2:564]

## 2-4. Create 1 extraction data file for mean and standard deviation

## Cleanup Column Names

colnames(cons_merge) <- c("Activity","Subject",as.vector(features[,2]))

## Create file to extract "Subject Number","Activity", Means, and Standard
##    Deviations
## Assumes all column names like "mean" and like "std" are the only ones that
## need to be included

feature_mean <- features[grep("mean",features$V2),]
feature_std <- features[grep("std",features$V2),]
feature_merge <- merge(feature_mean,feature_std,all=TRUE)
mean_std_data <- cons_merge[,c("Subject", "Activity",
                               as.vector(feature_merge[,2]))]
write.table(mean_std_data, file = "mean_std_data.txt")

## 5. Creates a second, independent tidy data set with averages for each
## variable of each activity and each subject
## Assumes averages of all columns should be included (not just the ones
## with "mean" within the column name)

cons_merge_melt <- melt(cons_merge, id.vars = c("Subject", "Activity"))
cons_merge_dcast <- dcast(cons_merge_melt, Subject + Activity ~ variable,
                          mean)
write.table(cons_merge_dcast, file = "mean_data.txt")