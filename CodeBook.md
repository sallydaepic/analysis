# CodeBook for Getting and Cleaning Data Project

## Data Source

- [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Variables

- **subject**: Identifier of the subject (1-30)
- **activity**: Activity label (WALKING, WALKING_UPSTAIRS, etc.)
- **All other variables**: Average of each measurement for each activity and subject. Variable names indicate:
    - Time/Frequency domain signals
    - Type of measurement (Accelerometer, Gyroscope, etc.)
    - Whether the value is a Mean or Standard Deviation

## Transformations

- Merged training and test sets.
- Extracted only mean and standard deviation measurements.
- Used descriptive activity names.
- Cleaned and expanded variable names for clarity.
- Created a tidy data set with the average of each variable for each activity and each subject.

## Example Variable

- `TimeBodyAccelerometerMean_mean`: Mean of time domain body accelerometer mean values, averaged for each activity and subject.
