# Objectif: how are we organising the data to address the question
#We assume that files have been downloard and extracted to a local directory.
#For the purpose of this analysis, mean was construed as those variables....
#Since all the data of avg_data are averages, it's not included in variable names

activity_labels     <- read.table(file="data/activity_labels.txt")
features            <- read.table(file="data/features.txt", as.is=T)

#Test
subject_test        <- read.table(file="data/test/subject_test.txt")
x_test              <- read.table(file="data/test/X_test.txt")
y_test              <- read.table(file="data/test/y_test.txt")
y_test[,1]          <- factor(y_test[, 1], levels=activity_labels[, 1], labels=activity_labels[, 2])
names(x_test)       <- features[,2]
names(subject_test) <- "subject"
names(y_test)       <- "activity"
tidy_test           <- cbind(subject_test, y_test, x_test)

#Train
subject_train       <- read.table(file="data/train/subject_train.txt")
x_train             <- read.table(file="data/train/X_train.txt")
y_train             <- read.table(file="data/train/y_train.txt")
y_train[,1]         <- factor(y_train[, 1], levels=activity_labels[, 1], labels=activity_labels[, 2])
names(x_train)      <- features[,2]
names(subject_train)<- "subject"
names(y_train)      <- "activity"
tidy_train          <- cbind(subject_train, y_train, x_train)

#All data
all_data            <- rbind(tidy_test, tidy_train)
mean_and_std        <- all_data[, c(1,2,grep("mean\\(\\)|std\\(\\)", names(tidy_data)))]
melted              <- melt(data=mean_and_std, id.vars=c(1,2))
avg_data            <- dcast(melted, subject+activity~variable, mean)
#write.csv(avg_data, file="avg_data.csv")
print(avg_data)