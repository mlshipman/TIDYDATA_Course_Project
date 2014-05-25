
ReadME for TIDYDATA dataset

======================

The TidyData_Project.R script produces a tidy dataset in a dataframe named TIDYDATA that is kept in the global R environment.  The script produces a final file output of TIDYDATA dataframe as a .csv file for easy reading into R or MSExcel.

The script also leaves the 'refined' DATA dataframe that shows the merged original data, with only those variables that were selected for the TIDYDATA dataframe.  All other working vectors and dataframes are removed at the end of the script.

The 'TIDYDATA Codebook.txt' contains a brief description of the resulting TIDYDATA dataset and the corresponding variables.

THE REMARK ANNOTATIONS IN THE SCRIPT DESCRIBE WHAT EACH FOLLOWING CODE STEP IS DOING IN THE SCRIPT!!!

All files are drawn from original data files stored in the working directory.

The TidyData_Project.R script basically joins the training and test datafiles using the merge funtion. These are first read and merged into a dataset for DATA, ACTIVITY, and SUBJECT, corresponding to both training and test data sets. The DATA file is then merged using cbind into a raw dataframe that has columns for activity and subject from the ACTIVITY and SUBJECT dataframes.  This contains all rows and all variable columns in the original training and test data files.

The FEATURES table is created to give the DATA file column headings that correspond to the feature names.  The COLNAMES vector is made by adding a "activity" and "subject" column name and then adds the variable names to the vector from the FEATURES dataframe.

The activities are listed in the DATA dataframe as numbers and need to have actual names.  THe ACTLABELS vector is created to have corresponding activity names to activity numbers.  The ACTLABELS vector is then used to replace the activity numbers in the activity column of DATA with real activity names.

The RETAIN vector is first created to isolate those names that contian either the phrase "mean" or "std" to pick out those variables related to mean or standard deviation.  The direction specific X, Y, or Z means are then deleted, since these are sumarized in the magitude variables.  The resulting RETAIN is used to eliminate all other variable columns except those in the RETAIN vector.

The final TIDYDATA dataframe is produced using the ddply from the plyr library so that each element of the TIDYDATA dataframe is the variable mean corresponding to the subject and activity in the DATA dataframe.

The RETAIN vector has all the names of the columns retained in the TIDYDATA dataframe.  These are then refined into plain english titles by a series of gsub commands that change the RETAIN vector into a vector of readable variable names.  (These names are explained in the TIDYDATA codebook text file.)  This vector is then used to rename the variables in the TIDYDATA and DATA dataframes.

At the end of the script, all non-essential vectors and dataframes are removed except for the TIDYDATA and DATA dataframes.  The TIDYDATA is retained because it is the resulting dataset, and the DATA dataframe is retained for referencing the data that results in each elemental mean in TIDYDATA.