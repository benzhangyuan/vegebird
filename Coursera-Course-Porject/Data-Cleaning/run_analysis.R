activity<-read.table("UCI HAR Dataset/activity_labels.txt")
activity<-as.character(activity$V2)
features<-read.table("UCI HAR Dataset/features.txt")
features<-as.character(features$V2)
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
strain<-read.table("UCI HAR Dataset/train/subject_train.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
stest<-read.table("UCI HAR Dataset/test/subject_test.txt")
x<-rbind(xtrain, xtest)
y<-rbind(ytrain, ytest)
s<-rbind(strain, stest)
names(x)<-features
names(y)<-"activity"
names(s)<-"subject"
stdmeancol<-grep("mean\\(\\)|std\\(\\)", names(x))
subset1<-x[,stdmeancol]
subset2<-cbind(subset1, y, s)
for (i in seq(along=activity)) {
subset2$activity<-sub(i, activity[i], subset2$activity)
}
library("reshape")
mlt<-melt(subset2, id=c("activity", "subject"))
subset3<-cast(mlt, subject ~ activity ~ variable, mean)
subset4<-as.data.frame.table(subset3, responseName="mean")
write.table(subset4, file="step5data.txt", row.name=F)
