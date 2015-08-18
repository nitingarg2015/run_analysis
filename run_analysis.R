run_analysis <- function() {

## Read Subject file and name the columns, this file should be kept in the folder containing train and test directories

	subjects <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))

	names(subjects) <- c("subject")

##Read features file (features.txt), data files (X_train & X_test), 
##name column names in data file from features file

	features <- read.table("features.txt")[,2]

	data <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))

	names(data) <- features
	
##Read activity labels (activity_labels) - only 2nd column
##Read data labels (y_train, x_train) and use activity labels file to name columns in data_labels

	activity_labels <- read.table("activity_labels.txt")[,2]

	data_labels <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))

	data_labels[,2] <- activity_labels[data_labels[,1]]
	
	names(data_labels) <- c("activityID", "activityName")
	

##Extract only those columns where mean or std dev is provided
	req_cols <- grep("mean|std",features)

	req_data <- data[,req_cols]

## add data_labels to the required data

	req_data <- cbind(data_labels, subjects, req_data)

	id_labels <- c(names(data_labels),names(subjects))
	
	data_labels <- setdiff(colnames(req_data), id_labels)

##Reshape data to report independent tidy data set with the average of each variable 
##for each activity and each subject
	
	molten <- melt(req_data, id = id_labels, measure.vars = data_labels)

	tidy_data <- dcast(molten, subject + activityName ~ variable, mean)

##write output to file tidy_data.txt

	write.table(tidy_data, file = "./tidy_data.txt", row.names= FALSE)

}
