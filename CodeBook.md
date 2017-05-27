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

The run_analysis script creates a tidy set out of the above files and outputs a summary table of mean values for a select number of attributes (the ones that were mean or standard deviation).  Below are the steps the script follows (see R file for more detailed comments):

* The script first downloads the dataset and extracts them locally
+ Note that this was more straightforward than assuming the data was present in the working directory, because the instructions did not specify whether the data would be zipped, extracted, or the specific files needed would be in the working director. Too ambiguous
* Three different types of data files have to be loaded and combined to create one large data set - these are first loaded into a data frame for the training and the test data sets
* The rows of the training and test data sets are merged using rbind for each of the three types
* For the measurements, the feature labels are combined with the data set, then a regular expression is used to extract the variables relating to mean and standard deviation
+ Note that the instructions were not clear as to whether to include the Mean Freq variables, so these were excluded
* Redable Column labels were added to the subject and activity data frames manually
* Activity identifiers for each observation were merged with the descriptive activity name
* All three data frames were combined to make one tidy data set
* Group By and Summarize were used to create the table with mean values per the instructions

# Output dataset

The tidydata.txt file contains the output of this script using the write.table() function.

## tidydata.txt Variable Descriptions

* Subject - the subject number from the data set
* ActivityName - the descriptive name of the activity 

All remaining variables represent the mean value for all the measurements corresponding to that subject and activity
