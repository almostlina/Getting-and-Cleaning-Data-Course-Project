# Code Book

## Data (URI HAR Dataset)
- The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. 
- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the **training data** and 30% the **test data**. 
- The project uses the 8 provided files in the dataset  which are: `features.txt`, `activity_labels.txt`, `x_train.txt`, `x_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt`. 
- The `features.txt` contains the variable name, which corresponds to each column of `x_train.txt` and `x_test.txt`. 
- The `activity_labels.txt` links the code labels with their activity names. Each activity code corresponds to each number in the `y_train.txt` and `y_test.txt`.
- Each row in 'subject_train.txt' identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Variables 

- "activities"            stores `activity_labels.txt`.  6 rows, 2 columns. Activity Types:
  + WALKING    
  + WALKING_UPSTAIRS 
  + WALKING_DOWNSTAIRS
  + SITTING   
  + STANDING
  + LAYING
- "features"              stores `features.txt`. 2947 rows, 561 columns.
- "subject_test"          stores `subject_test.txt`. 2947 rows, 1 column.
- "subject_train"         stores `subject_train.txt`. 7352  rows, 1 column.
- "subject_merged"        created by merging "subject_train" and "subject_test" using rbind(). 10299 rows, 1 columns.   
- "x_test"                stores `x_test.txt`. 2947 rows, 1 column.
- "x_train"               stores `x_train.txt`. 7352  rows, 1 column.
- "x_merge"               created by merging "x_train" and "x_test" using rbind(). 10299 rows, 561 columns.  
- "y_test"                stores `y_test.txt`. 2947 rows, 1 column.
- "y_train"               stores `y_train.txt`. 7352  rows, 1 column.
- "y_merge"               created by merging "y_train" and "y_test" using rbind(). 10299 rows, 1 columns. 
- "merged_dataset"        created by merging "subject_merged" and "x_merge" and "y_merge" using cbind(). 10299 rows, 563 columns. 
- "meanandstd"            created by subsetting "merged_dataset" and selecting only the subject and code columns, and the mean and standard deviation (std) for each measurement. 10299 rows, 88 columns. 
- "TidyDataset"           created by summarizing "meanandstd" and fetching the mean of each variable, grouped by subject and activity. 180 rows, 88 columns.

## Steps Followed 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
