
# Getting and Cleaning Data Project

This repository contains the files for the Coursera Getting and Cleaning Data course project.

## Files

- `run_analysis.R`: Main script to process and tidy the UCI HAR Dataset.
- `tidy_dataset.txt`: Output tidy data set.
- `CodeBook.md`: Describes the variables, data, and transformations.
- `README.md`: This file.

## How to Use

1. Download and unzip the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory.
2. Place `run_analysis.R` in the same directory.
3. Run the script in R:
    ```
    source("run_analysis.R")
    ```
4. The tidy dataset will be saved as `tidy_dataset.txt`.

## Script Overview

- Merges training and test data.
- Extracts mean and standard deviation measurements.
- Applies descriptive activity names.
- Labels variables descriptively.
- Creates a tidy data set with the average of each variable for each activity and subject.
