library(dplyr)

#Read in tables and label columns 
label <- read.table("activity_labels.txt")
colnames(label) <- c("ActivityLabel", "Activity")
feat <- read.table("features.txt")

#Read in tables and label columns related to training datasets
train_subj <- read.table("train/subject_train.txt")
colnames(train_subj) <- "Subject"
train_y <- read.table("train/y_train.txt")
colnames(train_y) <- "ActivityLabel"
#Read in features table, which contains the column names of X_train
train_x <- read.table("train/X_train.txt")
colnames(train_x) <- feat[,2]
#Paste subject_train, y_train and X_train next to each other
train <- cbind(train_subj, train_y, train_x)
#Merge with activity_labels
train_lab <- merge(train, label, by.x=2, by.y=1, all.x=T)
train_lab$Group <- rep("training", len=7352)

#Read in tables and label columns related to test datasets
test_subj <- read.table("test/subject_test.txt")
colnames(test_subj) <- "Subject"
test_y <- read.table("test/y_test.txt")
colnames(test_y) <- "ActivityLabel"
#Read in features table, which contains the column names of X_train
test_x <- read.table("test/X_test.txt")
colnames(test_x) <- feat[,2]
#Paste subject_train, y_train and X_train next to each other
test <- cbind(test_subj, test_y, test_x)
#Merge with activity_labels
test_lab <- merge(test, label, by.x=2, by.y=1, all.x=T)
test_lab$Group <- rep("test", len=2947)

#Combine training and test datasets: 
all <- rbind(train_lab, test_lab)

#Select only features containing mean or standard deviation
subset <- rbind(feat[(grepl("[Mm]ean", feat[,2])),], feat[(grepl("[Ss]td", feat[,2])),])
#Select columns that contain only features containing mean or standard deviation
all_sub1 <- all[,c(1,2,564:565)]
all_sub2 <- all[,(names(all)%in%subset[,2])]
all <- cbind(all_sub1, all_sub2)
#Sort table by Subject
all <- arrange(all,Subject)

#Calculate the mean per subject per activity:
data <- data.frame()
for (x in c(1:6)) { #For each activity:
  df0 <- all[(all[,1]==x),] #Subset data according to activity
  df1 <- df0[,c(5:90,2)] #Select only desired columns
  new <- data.frame(matrix(nrow=30,ncol=88)) #Generate empty dataframe
  for (i in c(1:86)) { #For each variable:
    new[,i] <- as.vector(tapply(df1[,i], df1[,87], mean)) #Calculate mean per subject
  }
  new[,87] <- c(1:30) #Add Subject Number
  new[,88] <- df0[1:30,3] #Add Activity
  data <- rbind(data, new) #Append data containing mean per subject per activity
}

data <- merge(data, all[,c(2,4)], by.x=87, by.y=1, all.x=T)
data <- data[,c(1,88:89,2:87)]
#Add column names:
colnames(data) <- c("Subject", "Activity", "Group", as.vector(subset[,2]))
#Make column names human readable:
names(data) <- sub("Acc","Accelerometer", names(data))
names(data) <- sub("Gyro","Gyroscope", names(data))
names(data) <- sub("std","Std", names(data))
names(data) <- sub("Mag","Magnitude", names(data))
names(data) <- sub("mean","Mean", names(data))
names(data) <- sub("Freq","Frequency", names(data))
names(data) <- gsub("-","", names(data))
#Write tidy dataset
write.table(data, "Tidy.txt", sep="\t", quote=F, row.names=F)