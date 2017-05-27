# Coursera Data Science Course 3 Project: Tidy Data
This repo contains the deliverables for the course 3 project on Tidy Data

run_analysis.R contains the script that will download a data set from the web, extracts mean values for activities, applies descriptive names as labels for each activity, and creates a tidy dataset that contains the mean for each variable for each activity and subject. 

The tidydata.txt file contains the output of this script using the write.table() function.  

#tidydata.txt Variable Descriptions
1. Subject - the subject number from the data set
2. ActivityName - the descriptive name of the activity
All remaining variables represent the mean value for all the measurements corresponding to that subject and activity

#Explanation of the script
* The script first downloads the dataset and extracts them locally
+ *Note that this was more straightforward than assuming the data was present in the working directory, because the instructions did not specify whether the data would be zipped, extracted, or the specific files needed would be in the working director.  Too ambiguous
* Three different types of data files have to be loaded and combined to create one large data set - these are first loaded into a data frame for the training and the test data sets
* The rows of the training and test data sets are merged using rbind for each of the three types
* For the measurements, the feature labels are combined with the data set, then a regular expression is used to extract the variables relating to mean and standard deviation
+ *Note that the instructions were not clear as to whether to include the Mean Freq variables, so these were excluded
* Redable Column labels were added to the subject and activity data frames manually
* Activity identifiers for each observation were merged with the descriptive activity name
* All three data frames were combined to make one tidy data set
* Group By and Summarize were used to create the table with mean values per the instructions
