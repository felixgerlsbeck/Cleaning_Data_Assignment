library(dplyr)

##Read the Data into R. Files must be in Working Directory.
test <- read.table("X_test.txt")
train <- read.table("X_train.txt")
test_labels <- read.table("y_test.txt", sep = " ")
train_labels <- read.table("y_train.txt", sep = " ")
activity_labels <- read.table("activity_labels.txt", sep = " ")
features <- read.table("", sep = " ")
subject_train <- read.table("subject_train.txt", sep = " ")
subject_test <- read.table("subject_test.txt", sep = " ")

##Create Vector of Variable Names
variable_names <- features[,2]

##Merge test and train data, test and train activity labels, and test and train subject identifiers
data <- rbind(test, train)
labels <- rbind(test_labels, train_labels)
subjects <- rbind(subject_test, subject_train)

##Set variable names to the descriptive names provided in features.txt
colnames(data) <- variable_names

##Extract only mean and sd measurements
data2 <- data[, grep("mean[^F]|std", colnames(data))]

##Add activity labels as additional factor variable, give them descriptive names
##and add subject identifiers
data3 <- cbind(data2, labels, subjects)
colnames(data3)[67] <- "activity"
colnames(data3)[68] <- "subjectID"
data3$activity <- factor(data3$activity, labels = activity_labels$V2)

##Create new dataset with averages of each variable for each subject and activity
grouped_data <- group_by(data3, subjectID, activity)
new <- summarize_each(grouped_data, funs(mean))
write.table(new, file = "Cleaning_Data_Assignment_New.txt", row.names=FALSE)


