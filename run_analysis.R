## Check to see if a director exists to download, store, and output datasets with (if not create it)
if (!file.exists("data")) {dir.create("data")}

## Download and save the source data file, then unzip it
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL, destfile = "data\\sourcedata.zip", method = "curl")
setwd("data")
#unzip("sourcedata.zip", overwrite = TRUE)
setwd("..")

## Load in the test data set first, then the training data set -> into data frames 
## (one with the measurements, one with the activity identifiers, and one with subjects -> for each set)
testmeasdf <- read.table("data\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
trainmeasdf <- read.table("data\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
testactdf <- read.table("data\\UCI HAR Dataset\\test\\y_test.txt", header = FALSE)
trainactdf <- read.table("data\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
testsubjdf <- read.table("data\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
trainsubjdf <- read.table("data\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)

## Merge measurements and activities into combined dataframes using rbind
measdf <- rbind(testmeasdf, trainmeasdf)
actdf <- rbind(testactdf, trainactdf)
subjdf <- rbind(testsubjdf, trainsubjdf)

## Load in features.txt, as it contains the names of the 561 variables (columns) in the dataframe
featuresdf <- read.table("data\\UCI HAR Dataset\\features.txt", header = FALSE)

## assign the features as the colnames of the merged data frame
colnames(measdf) <- featuresdf[,2]

## identify features that are mean or std.  Assuming this should not include "meanFreq" but instructions were not clear
withms <- grep("-(std|mean)\\(\\)", featuresdf[,2])

## create data frame that is only the columns of mean and std
msmdf <- measdf[,withms]

## load activity labels
actlabelsdf <- read.table("data\\UCI HAR Dataset\\activity_labels.txt", header = FALSE)

## clean up variable labels
colnames(actdf) <- c("ActivityID")
colnames(actlabelsdf) <- c("ActivityID", "ActivityName")
colnames(subjdf) <- c("Subject")

## use merge to match up the activity names to the identifiers
actnames <- merge(actdf, actlabelsdf)

## using cbind to put the activity names and subject numbers together with the measurements 
tidydf <- select(cbind(subjdf, actnames, msmdf), -ActivityID)

## use dplyr piping to get table instructions say to output
outputdf <- tidydf %>% group_by(Subject, ActivityName) %>% summarize_each(funs(mean)) 

## save output file to submit for class
write.table(outputdf, file="data\\tidyoutput.txt", row.names = FALSE)

outputdf
