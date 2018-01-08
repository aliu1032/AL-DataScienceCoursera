####################################################################
##                                                                ##
##                     Project                                    ##
##                                                                ##
####################################################################


#Step 0. downolaod the zip file and read the raw data
temp <- tempfile()
temp2 <-tempfile()

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
unzip(temp,list=TRUE)
unzip(zipfile=temp, exdir=temp2)

fpath <- file.path(temp2,'UCI HAR Dataset',fsep='\\')

activity_label <- read.table(file.path(fpath,'activity_labels.txt',fsep='\\'))
feature <- read.table(file.path(fpath,'features.txt',fsep='\\'), stringsAsFactor=FALSE)



# Step 1: read the observation data
# Adding the 'Subject Information
# Adding the Activity Code and Activity Description

testset <- read.table(file.path(fpath,'test','X_test.txt',fsep='\\'))
testsubject <- read.table(file.path(fpath,'test','subject_test.txt',fsep='\\'))
names(testsubject) <- c('subject')
testset <- cbind(testset,testsubject)

trainset <- read.table(file.path(fpath,'train','X_train.txt',fsep='\\'))
trainsubject <- read.table(file.path(fpath,'train','subject_train.txt',fsep='\\'))
names(trainsubject) <- c('subject')
trainset <- cbind(trainset,trainsubject)


# Adding the Activity Code and Activity Description
testlabel <- read.table(file.path(fpath,'test','y_test.txt',fsep='\\'))
testlabel <- merge(testlabel,activity_label, by.x='V1', by.y='V1')
names(testlabel) <- c('activitycode','activityname')
testset <- cbind(testset, testlabel) #by=0 means join by row names, i.e. index

trainlabel <- read.table(file.path(fpath,'train','y_train.txt',fsep='\\'))
trainlabel <- merge(trainlabel,activity_label, by.x='V1', by.y='V1')
names(trainlabel) <- c('activitycode','activityname')
trainset <- cbind(trainset, trainlabel)


# Step 2: Combine the Test and Training dataset into 1 big set
dataset <- rbind(testset,trainset)

# Step 3: Rename the columns with the Feature values
names(dataset) <- c(feature$V2,'subject','activitycode','activityname')



# Step 4: Find the column names contain the keywords 'mean' and 'standard deviation'
# Extract selected columns into Step4_data

mean_col <- which(grepl('mean', names(dataset)))
std_col <- which(grepl('std', names(dataset)))
other_col <- match(c('subject','activitycode','activityname'),names(dataset))

step4_data <- dataset[c(other_col, mean_col, std_col)]


#Step 5: Group the data by Activity + Subject, calculate the average of each column
result <-
    step4_data %>%
    group_by(activityname, subject) %>%
    summarize_all(funs(mean)) %>%
    arrange(subject)

write.table(result, file='Result_FinalProject.txt',row.name=FALSE)
