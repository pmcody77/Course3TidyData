# Input dataset
The source data came from the UCI Machine Learning repository:
*Human Activity Recognition Using Smartphones Data Set

Information available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here you will download a zip file.  The actual files used were:

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt'
* 'train/subject_test.txt'

# Script run

The run_analysis script creates a tidy set out of the above files and outputs a summary table of mean values for a select number of attributes (the ones that were mean or standard deviation)

# Output dataset

The tidydata.txt file contains the output of this script using the write.table() function.

## tidydata.txt Variable Descriptions

* Subject - the subject number from the data set
* ActivityName - the descriptive name of the activity 

All remaining variables represent the mean value for all the measurements corresponding to that subject and activity
