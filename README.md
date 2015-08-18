# run_analysis
Input Data

UCI dataset needs to be downloaded in the local directory and is extracted in the local directory. Code assumes that your current working directory is the directory that contains test and train directories

Input data meaning

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Input data files

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

Contents of these files are explained in the README.txt file of UCI dataset

Transformations

The script,  run_analysis.R , does the following:

1. Reads and merges test and train subject files
2. Reads and merges test and train data files
3. Reads features.txt file (2nd column) and sets its values as column names for data files
4. Reads and merges train and test files for activity labels, sets column names
5. Extracts only the measurements on the mean and standard deviation for each measurement
6. Reshapes the data, and reports independent tidy data set with the average of each variable for each activity and each subject
7. This tidy data set is reported as tidy_data.txt file in the active directory (with row.names = FALSE)

Output data

Average of each variable for each activity and each subject

The above variables were choosen where either mean or std was included in their original names.
