# run_analysis.R
# This script performs the following:
# 1. Merges the training and test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

# 1. Load data
data_dir <- "UCI HAR Dataset"
features <- read.table(file.path(data_dir, "features.txt"), col.names = c("index", "feature"))
activity_labels <- read.table(file.path(data_dir, "activity_labels.txt"), col.names = c("activityId", "activityLabel"))

# Training data
subject_train <- read.table(file.path(data_dir, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(data_dir, "train", "X_train.txt"))
y_train <- read.table(file.path(data_dir, "train", "y_train.txt"), col.names = "activity")

# Test data
subject_test <- read.table(file.path(data_dir, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(data_dir, "test", "X_test.txt"))
y_test <- read.table(file.path(data_dir, "test", "y_test.txt"), col.names = "activity")

# 2. Merge datasets
subjects <- rbind(subject_train, subject_test)
activities <- rbind(y_train, y_test)
features_data <- rbind(x_train, x_test)
colnames(features_data) <- features$feature

full_data <- cbind(subjects, activities, features_data)

# 3. Extract mean and std measurements
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$feature)
selected_names <- features$feature[mean_std_features]
selected_data <- full_data[, c("subject", "activity", selected_names)]

# 4. Use descriptive activity names
selected_data$activity <- factor(selected_data$activity, 
                                 levels = activity_labels$activityId, 
                                 labels = activity_labels$activityLabel)

# 5. Label data set with descriptive variable names
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
names(selected_data) <- gsub("-mean\\(\\)", "Mean", names(selected_data), ignore.case = TRUE)
names(selected_data) <- gsub("-std\\(\\)", "STD", names(selected_data), ignore.case = TRUE)
names(selected_data) <- gsub("-", "", names(selected_data))
names(selected_data) <- gsub("\\()", "", names(selected_data))

# 6. Create tidy data set with average of each variable for each activity and subject
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# 7. Write tidy data to file
write.table(tidy_data, "tidy_dataset.txt", row.names = FALSE)
