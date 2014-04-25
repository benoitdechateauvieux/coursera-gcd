#We assume that data files have been downloard and extracted to a local directory named "data" in the working directory
library(reshape)
library(reshape2)

#Loading labels
activity_labels     <- read.table(file="data/activity_labels.txt")
features            <- read.table(file="data/features.txt", as.is=T)

#Loading Test data
subject_test        <- read.table(file="data/test/subject_test.txt")
x_test              <- read.table(file="data/test/X_test.txt")
y_test              <- read.table(file="data/test/y_test.txt")
y_test[,1]          <- factor(y_test[, 1], levels=activity_labels[, 1], labels=activity_labels[, 2])
names(x_test)       <- features[,2]
names(subject_test) <- "subject"
names(y_test)       <- "activity"
tidy_test           <- cbind(subject_test, y_test, x_test)

#Loading Training data
subject_train       <- read.table(file="data/train/subject_train.txt")
x_train             <- read.table(file="data/train/X_train.txt")
y_train             <- read.table(file="data/train/y_train.txt")
y_train[,1]         <- factor(y_train[, 1], levels=activity_labels[, 1], labels=activity_labels[, 2])
names(x_train)      <- features[,2]
names(subject_train)<- "subject"
names(y_train)      <- "activity"
tidy_train          <- cbind(subject_train, y_train, x_train)

#Combining all data together
all_data            <- rbind(tidy_test, tidy_train)
#Extracting only the measurements on the mean and standard deviation for each measurement.
mean_and_std        <- all_data[, c(1,2,grep("mean\\(\\)|std\\(\\)", names(all_data)))]
#Creating a tidy data set with the average of each variable for each activity and each subject
melted              <- melt(data=mean_and_std, id.vars=c(1,2))
avg_data            <- dcast(melted, subject+activity~variable, mean)

#Renaming columns for human readability
names(avg_data)     <- c("Subject","Activity","TimeBodyAccMeanX","TimeBodyAccMeanY","TimeBodyAccMeanZ","TimeBodyAccStdX","TimeBodyAccStdY","TimeBodyAccStdZ","TimeGravityAccMeanX","TimeGravityAccMeanY","TimeGravityAccMeanZ","TimeGravityAccStdX","TimeGravityAccStdY","TimeGravityAccStdZ","TimeBodyAccJerkMeanX","TimeBodyAccJerkMeanY","TimeBodyAccJerkMeanZ","TimeBodyAccJerkStdX","TimeBodyAccJerkStdY","TimeBodyAccJerkStdZ","TimeBodyGyroMeanX","TimeBodyGyroMeanY","TimeBodyGyroMeanZ","TimeBodyGyroStdX","TimeBodyGyroStdY","TimeBodyGyroStdZ","TimeBodyGyroJerkMeanX","TimeBodyGyroJerkMeanY","TimeBodyGyroJerkMeanZ","TimeBodyGyroJerkStdX","TimeBodyGyroJerkStdY","TimeBodyGyroJerkStdZ","TimeBodyAccMagMean","TimeBodyAccMagStd","TimeGravityAccMagMean","TimeGravityAccMagStd","TimeBodyAccJerkMagMean","TimeBodyAccJerkMagStd","TimeBodyGyroMagMean","TimeBodyGyroMagStd","TimeBodyGyroJerkMagMean","TimeBodyGyroJerkMagStd","FrequencyBodyAccMeanX","FrequencyBodyAccMeanY","FrequencyBodyAccMeanZ","FrequencyBodyAccStdX","FrequencyBodyAccStdY","FrequencyBodyAccStdZ","FrequencyBodyAccJerkMeanX","FrequencyBodyAccJerkMeanY","FrequencyBodyAccJerkMeanZ","FrequencyBodyAccJerkStdX","FrequencyBodyAccJerkStdY","FrequencyBodyAccJerkStdZ","FrequencyBodyGyroMeanX","FrequencyBodyGyroMeanY","FrequencyBodyGyroMeanZ","FrequencyBodyGyroStdX","FrequencyBodyGyroStdY","FrequencyBodyGyroStdZ","FrequencyBodyAccMagMean","FrequencyBodyAccMagStd","FrequencyBodyBodyAccJerkMagMean","FrequencyBodyBodyAccJerkMagStd","FrequencyBodyBodyGyroMagMean","FrequencyBodyBodyGyroMagStd","FrequencyBodyBodyGyroJerkMagMean","FrequencyBodyBodyGyroJerkMagStd")

#write.table(avg_data, file="avg_data.txt")
print(avg_data)