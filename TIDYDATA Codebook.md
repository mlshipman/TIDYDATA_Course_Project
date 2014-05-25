
Codebook for TIDYDATA dataset

======================

The TidyData_Project.R script produces a tidy dataset in a dataframe named TIDYDATA.  The script produces a final file output of TIDYDATA dataframe as a .csv file for easy reading into R or MSExcel.

The first two columns of TIDYDATA indicate the row corresponding to the activity and subject performing the activity.  

The following columns to the right of the "subject" column are the variable categories of the each type of measurement listed in the DATA dataset.  The variables are summarized means of the corresponding normalization measurments in the DATA dataframe.

The final variables summarized are as follows:
NOTE:  FFT is "Fast Fourier Transformed"
"activity" = The activity summarized on the corresponding row in TIDYDATA
"subject" = The subject ID of the subject performing the activity
"Body Accl Mag Mean" = Body accelerometer magnitude mean
"Grav Accl Mag Mean" = Gravity accelerometer magnitude mean
"Body Accl Jerk Mag Mean" = Body accelerometer jerk force magnitude mean
"Body Gyro Mag Mean" = Body gyroscope magnitude mean
"Body Gyro Jerk Mag Mean" = Body gyroscopic jerk force magnitude mean
"Body Freq Accl Mag Mean" = Body FFT frequency accelerometer magnitude mean
"Body Freq Accl Mag Wt Mean By Freq" = Body FFT frequency accelerometer magnitude weighted mean by frequency
"Body Freq Accl Jerk Mag Mean" = Body FFT frequency jerk force accelerometer magnitude mean
"Body Freq Accl Jerk Mag Wt Mean By Freq" = Body FFT frequency jerk force accelerometer magnitude weighted mean by frequency
"Body Freq Gyro Mag Mean" = Body FFT frequency gyroscope magnitude mean
"Body Freq Gyro Mag Wt Mean By Freq"= Body FFT frequency gyroscope magnitude weighted mean by frequency
"Body Freq Gyro Jerk Mag Mean" = Body FFT frequency gyroscopic jerk force magnitude mean
"Body Freq Gyro Jerk Mag Wt Mean By Freq" = Body FFT frequency gyroscopic jerk force magnitude weighted mean by frequency
"Body Accl Mag Std Dev" = Body accelerometer magnitude standard deviation
"Grav Accl Mag Std Dev" = Gravity accelerometer magnitude standard deviation
"Body Accl Jerk Mag Std Dev" = Body accelerometer jerk force magnitude standard deviation
"Body Gyro Mag Std Dev" = Body gyroscope magnitude standard deviation
"Body Gyro Jerk Mag Std Dev" = Body gyroscopic jerk force magnitude standard deviation
"Body Freq Accl Mag Std Dev" = Body FFT frequency accelerometer magnitude standard deviation
"Body Freq Accl Jerk Mag Std Dev" = Body FFT frequency jerk force accelerometer magnitude standard deviation
"Body Freq Gyro Mag Std Dev" = Body FFT frequency gyroscope magnitude standard deviation
"Body Freq Gyro Jerk Mag Std Dev" = Body gyroscopic jerk force magnitude standard deviation


The variables were chosen from the source datasets by the project specification of getting the variable of "mean" and "std dev".  These were pared down to a set of 22 variables by eliminating uni-directional variable means and std devs.  These were the single direction X, Y, and Z.  The reason for this was these variables were summarized into the overall categories which were kept in the aforementioned list.  Any other variables were removed so that an original list of 561 variables are reduced to a list of 24 variables.

Each element of the TIDYDATA data frame is the mean of the corresponding variable in the DATA merged dataframe, so that the TIDYDATA dataframe is an average summary of the variables for each combination of activity and subject.  These averages are listed in each row that correspond the the individual activity and subject listed in the "activity" and "subject" column.

The code will also leave the refined DATA dataframe so that the original data of the selected variables can be viewed in needed.
