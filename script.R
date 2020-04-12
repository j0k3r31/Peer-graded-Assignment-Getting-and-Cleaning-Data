x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")


x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")


features <- read.table('features.txt')
activityLabels = read.table('activity_labels.txt')


colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectID"


colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

##View(tidydata)


merg_train <- cbind(y_train, subject_train, x_train)
merg_test <- cbind(y_test, subject_test, x_test)
my.data <- rbind(merg_train, merg_test)


colNames <- colnames(my.data)

mean.and.sd <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames)                 )


mean.and.sd.subset<-my.data[ , mean.and.sd == TRUE]

activity.names.subset<- merge(mean.and.sd.subset, activityLabels, by='activityId',all.x=TRUE)



Tidy.Set <- aggregate(. ~subjectId + activityId, activity.names.subset, mean)
Tidy.Set <- Tidy.Set[order(Tidy.Set$subjectId, Tidy.Set$activityId),]



write.table(Tidy.Set, "Tidy Data.txt", row.name=FALSE)






