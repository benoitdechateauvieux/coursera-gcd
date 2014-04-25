# Getting and Cleaning Data Project

## Description of the study
This project is the Peer Assessment project of the "Getting & Cleaning Data" course which is part of the "Datascience" specialization provided by the Johns Hopkins Bloomberg School of Public Health in Coursera.

This project can be seen as a preliminatory data preparation phase in order to adress a question.
The question and the analysis is not part of this work.
In this project, we focus on how we are organising the data to address the question.

## Study design
The data used for this analysis represent data collected from the accelerometers from the Samsung Galaxy S smartphone for the study

*Human Activity Recognition Using Smartphones Dataset*  
*Version 1.0*

by

*Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto*  
*Smartlab - Non Linear Complex Systems Laboratory*  
*DITEN - Universite degli Studi di Genova*  

The data has been has obtained at the following URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
A full description of the input data is available at the site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


## Code book
The following steps has been applyied to the original dataset in order to clean up the data

1. Loading test set and labels from */test/X_test.txt* and */test/y_test.txt*
2. Loading subjects who performed the activity for each window sample from *test/subject_test.txt*
3. Naming the columns with features names contained in *features.txt*
4. Binding those 3 data set (test, labels and subject) in a global *test* data set
5. Repeating the steps 1 to 4 with the *training* data
6. Merging *test* and *training* data set
7. Extracting only the measurements on the mean and standard deviation for each measurement. For the purpose of this analysis, mean was construed as variables having names ending with *mean()* and standard deviation was construed as variables having names ending with *std()*
8. Appropriately labeling the data set with descriptive human readable activity names
9. Creating a tidy data set with the average of each variable for each activity and each subject using melt and dcast R functions.


**Note**: All the variables been normalised by the original study (subtract the mean, divide by the standard deviation) so the units cancel and they are unitless.


Variable | Description
--- | ---
Subject | The id of the subject who performed the activity for each window sample. Its range is from 1 to 30.
Activity | One of the six activities performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
TimeBodyAccMeanX | Mean value of the Body Acceleration (Time domain signal) - X direction
TimeBodyAccMeanY | Mean value of the Body Acceleration (Time domain signal) - Y direction
TimeBodyAccMeanZ | Mean value of the Body Acceleration (Time domain signal) - Z direction
TimeBodyAccStdX | Standard deviation of the Body Acceleration (Time domain signal) - X direction
TimeBodyAccStdY | Standard deviation of the Body Acceleration (Time domain signal) - Y direction
TimeBodyAccStdZ | Standard deviation of the Body Acceleration (Time domain signal) - Z direction
TimeGravityAccMeanX | Mean value of the Gravity Acceleration (Time domain signal) - X direction 
TimeGravityAccMeanY | Mean value of the Gravity Acceleration (Time domain signal) - Y direction 
TimeGravityAccMeanZ | Mean value of the Gravity Acceleration (Time domain signal) - Z direction 
TimeGravityAccStdX | Standard deviation of the Gravity Acceleration (Time domain signal) - X direction
TimeGravityAccStdY | Standard deviation of the Gravity Acceleration (Time domain signal) - Y direction
TimeGravityAccStdZ | Standard deviation of the Gravity Acceleration (Time domain signal) - Z direction
TimeBodyAccJerkMeanX | Mean value of the Jerk signal of the Body Acceleration (Time domain signal) - X direction 
TimeBodyAccJerkMeanY | Mean value of the Jerk signal of the Body Acceleration (Time domain signal) - Y direction 
TimeBodyAccJerkMeanZ | Mean value of the Jerk signal of the Body Acceleration (Time domain signal) - Z direction 
TimeBodyAccJerkStdX | Standard deviation of the Jerk signal of the Body Acceleration (Time domain signal) - X direction
TimeBodyAccJerkStdY | Standard deviation of the Jerk signal of the Body Acceleration (Time domain signal) - Y direction
TimeBodyAccJerkStdZ | Standard deviation of the Jerk signal of the Body Acceleration (Time domain signal) - Z direction
TimeBodyGyroMeanX | Mean value of the Gyroscope signal (Time domain signal) - X direction
TimeBodyGyroMeanY | Mean value of the Gyroscope signal (Time domain signal) - Y direction
TimeBodyGyroMeanZ | Mean value of the Gyroscope signal (Time domain signal) - Z direction
TimeBodyGyroStdX | Standard deviation of the Gyroscope signal (Time domain signal) - X direction
TimeBodyGyroStdY | Standard deviation of the Gyroscope signal (Time domain signal) - Y direction
TimeBodyGyroStdZ | Standard deviation of the Gyroscope signal (Time domain signal) - Z direction
TimeBodyGyroJerkMeanX | Mean value of the Jerk signals of the Gyroscope signal (Time domain signal) - X direction
TimeBodyGyroJerkMeanY | Mean value of the Jerk signals of the Gyroscope signal (Time domain signal) - Y direction
TimeBodyGyroJerkMeanZ | Mean value of the Jerk signals of the Gyroscope signal (Time domain signal) - Z direction
TimeBodyGyroJerkStdX | Standard deviation of the Jerk signals of the Gyroscope signal (Time domain signal) - X direction
TimeBodyGyroJerkStdY | Standard deviation of the Jerk signals of the Gyroscope signal (Time domain signal) - Y direction
TimeBodyGyroJerkStdZ | Standard deviation of the Jerk signals of the Gyroscope signal (Time domain signal) - Z direction
TimeBodyAccMagMean | Mean value of the Magnitude of Body Acceleration (Time domain signal)
TimeBodyAccMagStd | Standard deviation of the Magnitude of Body Acceleration (Time domain signal)
TimeGravityAccMagMean | Mean value of the Magnitude of Gravity Acceleration (Time domain signal)
TimeGravityAccMagStd | Standard deviation of the Magnitude of Gravity Acceleration (Time domain signal)
TimeBodyAccJerkMagMean | Mean value of the Jerk signals of the Magnitude of Gravity Acceleration (Time domain signal)
TimeBodyAccJerkMagStd | Standard deviation of the Jerk signals of the Magnitude of Gravity Acceleration (Time domain signal)
TimeBodyGyroMagMean | Mean value of the Magnitude of the Gyroscope signals (Time domain signal) 
TimeBodyGyroMagStd | Standard Deviation of the Magnitude of the Gyroscope signals (Time domain signal)
TimeBodyGyroJerkMagMean | Mean value of the Jerk signals of the Magnitude of the Gyroscope signals (Time domain signal)
TimeBodyGyroJerkMagStd | Standard Deviation of the Jerk signals of the Magnitude of the Gyroscope signals (Time domain signal)
FrequencyBodyAccMeanX | Mean value of the Fast Fourier Transform applied to Body Acceleration - X direction
FrequencyBodyAccMeanY | Mean value of the Fast Fourier Transform applied to Body Acceleration - Y direction
FrequencyBodyAccMeanZ | Mean value of the Fast Fourier Transform applied to Body Acceleration - Z direction
FrequencyBodyAccStdX | Standard Deviation of the Fast Fourier Transform applied to Body Acceleration - X direction
FrequencyBodyAccStdY | Standard Deviation of the Fast Fourier Transform applied to Body Acceleration - Y direction
FrequencyBodyAccStdZ | Standard Deviation of the Fast Fourier Transform applied to Body Acceleration - Z direction
FrequencyBodyAccJerkMeanX | Mean value of the Fast Fourier Transform applied to the Jerk signals of Body Acceleration - X direction
FrequencyBodyAccJerkMeanY | Mean value of the Fast Fourier Transform applied to the Jerk signals of Body Acceleration - Y direction
FrequencyBodyAccJerkMeanZ | Mean value of the Fast Fourier Transform applied to the Jerk signals of Body Acceleration - Z direction
FrequencyBodyAccJerkStdX | Standard Deviation of the Fast Fourier Transform applied to the Jerk signals of Body Acceleration - X direction
FrequencyBodyAccJerkStdY | Standard Deviation of the Fast Fourier Transform applied to the Jerk signals of Body Acceleration - Y direction
FrequencyBodyAccJerkStdZ | Standard Deviation of the Fast Fourier Transform applied to the Jerk signals of Body Acceleration - Z direction
FrequencyBodyGyroMeanX | Mean value of the Fast Fourier Transform applied to Gyroscope signal - X direction
FrequencyBodyGyroMeanY | Mean value of the Fast Fourier Transform applied to Gyroscope signal - Y direction
FrequencyBodyGyroMeanZ | Mean value of the Fast Fourier Transform applied to Gyroscope signal - Z direction
FrequencyBodyGyroStdX | Standard Deviation of the Fast Fourier Transform applied to Gyroscope signal - X direction
FrequencyBodyGyroStdY | Standard Deviation of the Fast Fourier Transform applied to Gyroscope signal - Y direction
FrequencyBodyGyroStdZ | Standard Deviation of the Fast Fourier Transform applied to Gyroscope signal - Z direction
FrequencyBodyAccMagMean | Mean value of the Fast Fourier Transform applied to Magnitude of Body Acceleration
FrequencyBodyAccMagStd | Standard Deviation of the Fast Fourier Transform applied to Magnitude of Body Acceleration
FrequencyBodyBodyAccJerkMagMean | Mean value of the Fast Fourier Transform applied to the Jerk signals of the Magnitude of Body Acceleration
FrequencyBodyBodyAccJerkMagStd | Standard Deviation of the Fast Fourier Transform applied to the Jerk signals of the Magnitude of Body Acceleration
FrequencyBodyBodyGyroMagMean | Mean value of the Fast Fourier Transform applied to the Magnitude of Gyroscope signal
FrequencyBodyBodyGyroMagStd | Standard Deviation of the Fast Fourier Transform applied to the Magnitude of Gyroscope signal
FrequencyBodyBodyGyroJerkMagMean | Mean value of the Fast Fourier Transform applied to the Jerk signals of the Magnitude of Gyroscope signal
FrequencyBodyBodyGyroJerkMagStd | Standard Deviation of the Fast Fourier Transform applied to the Jerk signals of the Magnitude of Gyroscope signal

Since all the data are averages, "averages" is not included in variables name.
