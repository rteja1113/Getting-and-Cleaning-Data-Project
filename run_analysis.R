library(reshape2)
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activitylabels[,2] <- as.character(activitylabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
wantedvariables <- grep(".*mean.*|.*std.*",features[,2])
wantedvariables.names <- features[wantedvariables,2]
wantedvariables.names <- gsub("-mean","Mean",wantedvariables.names)
wantedvariables.names <- gsub("-std","Std",wantedvariables.names)
wantedvariables.names <- gsub("[-()]","",wantedvariables.names)
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")[,wantedvariables]
train_activity <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.data <- cbind(train_subject,train_activity,train_data)
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")[,wantedvariables]
test_activity <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.data <- cbind(test_subject,test_activity,test_data)
new_data <- rbind(train.data,test.data)
colnames(new_data) <- c("subject","activity",wantedvariables.names)
new_data$activity <- factor(new_data$activity,levels = activitylabels[,1],labels = activitylabels[,2])
new_data$subject <- factor(new_data$subject)
melted_data <- melt(new_data,id=c("subject","activity"))
averaged_melted_data <- dcast(melted_data,subject+activity~variable,mean)
write.table(averaged_melted_data,"tidydata.txt",row.names = FALSE,quote = FALSE)



