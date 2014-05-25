#Reads and merges the test and training datasets to form DATA dataframe.
DATA <- merge(read.table('X_test.txt'), read.table('X_train.txt'), all = "TRUE")

#Reads and merges the activity numbers of the test and training datasets
# to form ACTIVITY dataframe.
ACTIVITY <- rbind(read.table('y_test.txt'), read.table('y_train.txt'))

#Reads and merges the subject numbers of the test and training datasets.
SUBJECT <- rbind(read.table('subject_test.txt'), read.table('subject_train.txt'))

#Adds the ACTIVITY and SUBJECT columns to the DATA dataframe.
DATA <- cbind(ACTIVITY, SUBJECT, DATA)

#Reads the variable feature descriptions into variable FEATURES.
FEATURES <- read.table('features.txt')

#Converts the FEATURES names to a character vector, then creates a character
#  vector for the DATA column names.
COLNAMES <- c("activity", "subject", as.character(FEATURES$V2))

#Uses the FEATURE dataset to create the names for DATA dataframe.
names(DATA) <- COLNAMES

#Replace the activity number with an activity name from the ACTLABELS vector.
ACTLABELS <- read.table('activity_labels.txt')
ACTLABELS <- as.character(ACTLABELS$V2)
for (i in 1:6){
        DATA$activity[(DATA$activity == as.character(i))] <- ACTLABELS[i] 
}

#Create a RETAIN vector of column names that contain "mean" or "std" in the DATA column names.
RETAIN <- c("activity", "subject", names(DATA)[grep("mean", names(DATA))],names(DATA)[grep("std", names(DATA))])
#Identifies the rows with "-X", "-Y", and "-Z" direction specific measurements as a 
#  logical TRUE/FALSE vector.
XYZRows <- RETAIN %in% RETAIN[c(grep("-X", RETAIN), grep("-Y", RETAIN), grep("-Z", RETAIN))]
#Reforms RETAIN to exclude the direction specific measurement means and std dev.
RETAIN <- RETAIN[(XYZRows == FALSE)]

#Recreates DATA by extracting only those columns having the names within the RETAIN vector.
#  These are only those column names that contain "mean" and "std'.
DATA <- DATA[, RETAIN]

#Creates a summary dataframe of each retained variable's mean by subject and activity.
library(plyr)
TIDYDATA <- ddply(DATA, .(activity, subject), numcolwise(mean))

#Series of gsub's will reform the variable names in RETAIN to understandable english names
# that represent what the variable really represents.
RETAIN <- gsub("tBody", "Body ", RETAIN)
RETAIN <- gsub("fBody", "Body Freq ", RETAIN)
RETAIN <- gsub("tGravity", "Grav ", RETAIN)
RETAIN <- gsub("AccMag", "Accl Mag ", RETAIN)
RETAIN <- gsub("GyroMag", "Gyro Mag ", RETAIN)
RETAIN <- gsub("GyroJerkMag", "Gyro Jerk Mag ", RETAIN)
RETAIN <- gsub("BodyGyro", "Gyro", RETAIN)
RETAIN <- gsub("AccJerkMag", "Accl Jerk Mag ", RETAIN)
RETAIN <- gsub("BodyAccl", "Accl", RETAIN)
RETAIN <- gsub("-meanFreq", "Wt Mean By Freq", RETAIN)
RETAIN <- gsub("-mean", "Mean", RETAIN)
RETAIN <- gsub("-std", "Std Dev", RETAIN)
RETAIN <- gsub("()", "", RETAIN, fixed = TRUE)

#The reformed RETAIN vector names are now used to replace the variable column names in 
# both TIDYDATA and DATA
names(TIDYDATA) <- RETAIN
names(DATA) <- RETAIN

#Writes the TIDYDATA dataframe to a .csv file for easy reading into R or MSexcel.
write.csv(TIDYDATA, file = "TIDYDATA_csv.txt")


#Removes all but the merged raw in the DATA and the resulting TIDYDATA dataframes
# from the environment.
remove(ACTIVITY, ACTLABELS, COLNAMES, FEATURES, RETAIN, SUBJECT, XYZRows, i)
