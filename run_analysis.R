
#set the working directory

setwd("C:/Users/HP/Desktop/Lina/Coursera/Getting and Cleaning Data (Johns Hopkins University)/Week 4/Project/UCI HAR Dataset")

#load {dplyr} package

library(dplyr)

#assign all files to data frames with descriptive names

features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt", col.names = features$functions)
y_test <- read.table("test/y_test.txt", col.names = "code")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt", col.names = features$functions)
y_train <- read.table("train/y_train.txt", col.names = "code")

# 1. merge the training and the test sets to create one data set

x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

merged_dataset <- cbind(subject_merged, y_merge, x_merge)


# 2. extract only the measurements on the mean and standard deviation for each measurement

meanandstd <- select(merged_dataset, subject, code, contains("mean"), contains("std"))


# 3. uses descriptive activity names to name the activities in the data set
# assign the activity name instead of the activity code by matching them according to 
# the activity labels in the activities table

meanandstd$code <- activities[meanandstd$code, 2]
# now that this col contains the name not the code, change its name to reflect that
names(meanandstd)[2] <- "activity" 


# 4. appropriately label the data set with descriptive VARIABLE names
# replace all abbreviations to make names more comprehendable
# remove needless characters
# fix letter cases (capitalizations) 


names(meanandstd)<-gsub("-mean()", "Mean", names(meanandstd), ignore.case = TRUE)
names(meanandstd)<-gsub("-std()", "STD", names(meanandstd), ignore.case = TRUE)
names(meanandstd)<-gsub("-freq()", "Frequency", names(meanandstd), ignore.case = TRUE)
names(meanandstd)<-gsub("^t", "Time", names(meanandstd))
names(meanandstd)<-gsub("^f", "Frequency", names(meanandstd))
names(meanandstd)<-gsub("Acc", "Accelerometer", names(meanandstd))
names(meanandstd)<-gsub("Gyro", "Gyroscope", names(meanandstd))
names(meanandstd)<-gsub("BodyBody", "Body", names(meanandstd))
names(meanandstd)<-gsub("Mag", "Magnitude", names(meanandstd))
names(meanandstd)<-gsub("tBody", "TimeBody", names(meanandstd))
names(meanandstd)<-gsub("angle", "Angle", names(meanandstd))
names(meanandstd)<-gsub("gravity", "Gravity", names(meanandstd))


# 5. from dataset in step #4, creates a second, independent tidy data set with the MEAN of
# each variable for each ACTIVITY and each SUBJECT 

TidyDataset <- meanandstd %>% group_by(subject, activity) %>% summarize_all(mean)

# Output File

write.table(TidyDataset, file = "TidyDataset.txt", row.name=FALSE)




