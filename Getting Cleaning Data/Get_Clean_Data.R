# vector
z <- c(1.1, 9 , 3.14)
# vector calculation
z * 2 + 100

#rm(list=ls())
#setwd()
#data()
getwd()

file_path <-"C:/Users/April/Documents/LearnR/Getting & Cleaining Data Course/data/"

####################################################################
##                                                                ##
##                     Project                                    ##
##                                                                ##
####################################################################

#You should create one R script called run_analysis.R that does the following.

#0. downolaod the zip file and read the raw data
temp <- tempfile()
temp2 <-tempfile()

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
unzip(temp,list=TRUE)
unzip(zipfile=temp, exdir=temp2)

fpath <- file.path(temp2,'UCI HAR Dataset',fsep='\\')

activity_label <- read.table(file.path(fpath,'activity_labels.txt',fsep='\\'))
feature <- read.table(file.path(fpath,'features.txt',fsep='\\'), stringsAsFactor=FALSE)



# read the observation data
testset <- read.table(file.path(fpath,'test','X_test.txt',fsep='\\'))
testsubject <- read.table(file.path(fpath,'test','subject_test.txt',fsep='\\'))
names(testsubject) <- c('subject')
testset <- cbind(testset,testsubject)

trainset <- read.table(file.path(fpath,'train','X_train.txt',fsep='\\'))
trainsubject <- read.table(file.path(fpath,'train','subject_train.txt',fsep='\\'))
names(trainsubject) <- c('subject')
trainset <- cbind(trainset,trainsubject)
                           
                           
#3.Uses descriptive activity names to name the activities in the data set
testlabel <- read.table(file.path(fpath,'test','y_test.txt',fsep='\\'))
testlabel <- merge(testlabel,activity_label, by.x='V1', by.y='V1')
names(testlabel) <- c('activitycode','activityname')
testset <- cbind(testset, testlabel) #by=0 means join by row names, i.e. index

# prepare the training set
trainlabel <- read.table(file.path(fpath,'train','y_train.txt',fsep='\\'))
trainlabel <- merge(trainlabel,activity_label, by.x='V1', by.y='V1')
names(trainlabel) <- c('activitycode','activityname')
trainset <- cbind(trainset, trainlabel)


#1.Merges the training and the test sets to create one data set.
dataset <- rbind(testset,trainset)

#4.Appropriately labels the data set with descriptive variable names.
names(dataset) <- c(feature$V2,'subject','activitycode','activityname')

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#library(tidyr)
#temp <- separate(data=feature, col=V2,sep='-', into=c('part1','part2','part3'))
#temp <- extract(data=feature, col=V2, into=c('part1','part2','part3','part4'),
#                '([:alpha:]+)-([:alpha:]+)([:punct:]+)([:alpha:]+)')

mean_col <- which(grepl('mean', names(dataset)))
std_col <- which(grepl('std', names(dataset)))
other_col <- match(c('subject','activitycode','activityname'),names(dataset))

step4_data <- dataset[c(other_col, mean_col, std_col)]


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
result <-
    step4_data %>%
    group_by(activityname, subject) %>%
    summarize_all(funs(mean)) %>%
    arrange(subject)

write.table(result, file='Result_FinalProject.txt',row.name=FALSE)

#melt, dcast

####################################################################
##                                                                ##
##                     Week 4                                     ##
##                                                                ##
####################################################################

tolower(names(cameraData))
strsplit(names(cameraData,"\\."))
sub("_","",testName)
gsub("_","",testName)
grep("Alameda", cameraData$intersection)  # return the index of the found 

table(grepl("Alameda", cameraData$intersection))
nchar()
substr()
paste("a","b",sep="/")

library('lubridate')


# Question 1
# Apply strsplit() to split all the names of the data frame on the characters "wgtp".
# What is the value of the 123 element of the resulting list?

fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileurl,paste(file_path,"housing.csv",sep=""))
data <- read.csv(paste(file_path,"housing.csv",sep=""))
temp <- names(data)
strsplit(temp,"^wgtp")[[123]]


grep("^wgtp",temp)  # search for matching pattern

# Question 2
# load the GDP data
library('RCurl')
fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileurl,paste(file_path,"GDP.csv",sep=""), method="curl")
data <- read.csv(paste(file_path,"GDP.csv",sep=""), skip=4)
data$X.4 <- gsub(",","",data$X.4)

mean(as.numeric(trimws(data$X.4[1:190])))

# Question 3
#How many countries begin with United

grep("^United", data$X.3[1:190])
length(grep("^United", data$X.3[1:190]))

#question 4
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(fileurl,paste(file_path,"education.csv",sep=""), method="curl")
EDdata <- read.csv(paste(file_path,"education.csv",sep=""))

# step 1: selec the EDdata where Special Notes contains "fiscal year" and 'June'
row <- grep("(.*)Fiscal year(.*)June(.*)", EDdata$Special.Notes)
length(row)

#question 5:
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes = index(amzn)

library(lubridate)
temp_year <- year(sampleTimes)
sum(temp_year==2012)


temp <- sampleTimes[temp_year==2012]
temp_date <- weekdays(temp)
sum(temp_date=='Monday')
####################################################################
##                                                                ##
##                     Week 3                                     ##
##                                                                ##
####################################################################
X[which(X$var>2),]

sort(x$var1, decreasing = TRUE)
sort(x$var, na.last = TRUE)

x[order(X$var1,X$var4),]

str(testData)
quantile(test$var1)
quantitle(test$var1,probs=c(0.5, 0.75, 0.9))
table(test$var, useNA='ifany')
table(test$var1, test$var2)

table(test$var %in% c("123",'345'))
restData[restData$var %in% c("123",'345')]

data(USBAdmissions)
DF = as.data.frame(USBAdmissions)
summary(df)
object.size(data, unit='Mb')

xt <- xtabs(Freq ~ Gender + Admin, data=DF)
xt <- xtabs(breaks ~.,)

restData$zipGroups = cut(resData$zeip, breaks=quantile=cdfd)
libaray(Hmisc)
restData$zipGroups = cut2(restData$var, g=4)

libaray(plyr)
restDat2 <- mutate(restData, zipGroups=cut2(zipCode, g=4))

restData$var1fc <- factor(restData$var1)
relevel(yesnofac, ref='yes')
as.numeric(yesnofac)

ftable(xt)

#-----------------

data(UCBAdmissions)
test1 <- data.frame(UCBAdmissions)
data(mtcars)
head(mtcars)

# R ways
test1[,1]
test1[1,]
test1[2:3, 1:2]
test1[2:3, c(1,4)]
test1[, match('Freq', names(test1))]
test1[, match('Gender', names(test1))]
test1[test1$Freq>300,]
test1[which(test1$Gender=='Male'),]
unique(test1$Admit)
unique(test1$Freq)
str(test1)

library(dplyr)
# subset columns
select(test1, 'Admit')
select(test1, 'Admit','Freq')
select(test1, Admit:Gender)
select(test1, c(Admit, Freq))
select(test1, Admit:Freq)
select(test1, -Dept)

#subset rows
filter(test1, Admit=='Rejected')
filter(test1, Admit=='Admitted' & Gender=='Female')

arrange(test1,desc(Freq))
arrange(test1,(Freq))

head(rename(test1,Department=Dept, Frequency=Freq))
head(test1)

mutate(test1,New_Freq = Freq*10)
head(test1)
mutate(test1, New_col = paste(Admit,Gener, sep="::"))

test2 <- mutate(test1, New_col= (factor(test1$Freq>300, labels=c('Big','Small'))))
filter(test1, New_col=='Small')
BigSmall <- group_by(test2, New_col)
BigSmall
summarize(BigSmall)
#pivot
data_melt <- melt(input_data,id=c('carname','gear','cyl'), measure.vars=c('mpg','hp'))
data_summary <-dcast(carMelt, cyl ~ variable)

library(tidyr)
# http://vita.had.co.nz/papers/tidy-data.pdf


gather()    # stack, unpivot
separate()  # split a column into columns

students2 %>%
    gather(sex_class , count , -grade ) %>%
    separate(sex_class, c("sex", "class")) %>%
    print

students3 %>%
    gather(class, grade, class1:class5, na.rm = TRUE) %>%
    spread(test, grade) %>%
    print


## question 1:
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
data <- read.csv(fileurl,header=TRUE, sep=",")

# Create a logical vector that identifies the households on greater than 10 acres
# who sold more than $10,000 worth of agriculture products. Assign that logical vector
# to the variable agricultureLogical. Apply the which() function like this to identify
# the rows of the data frame where the logical vector is TRUE.

library(dplyr)

# ACR Lot size (3. House on ten or more acres)
# AGS Sales of Agriculture Products (6 $10,000+)
temp <- mutate(data, a=(ACR == 3 & AGS == 6))
agricultureLogical <- data$ACR==3 & data$AGS == 6
which(agricultureLogical)     

## question 2:
install.packages("jpeg")
library(jpeg)
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
data <- paste(getwd(),'data.jpg', sep='')

download.file(fileURL, destfile = data ,mode="wb", method="curl")
input <- readJPEG(data, native=TRUE)
quantile(input,c(0.3,0.8))

## Question 3:
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
data1 <- read.csv(fileurl,header=TRUE, sep=",", skip=4)
data1 <- data1 %>% 
        select(X, X.1) %>%
        filter(X.1 %in% seq(1:190))

### careful with converting numeric factor level into numeric value
## as.numeric(data1$Ranking)  returns levels(data1$X.1)
## https://stackoverflow.com/questions/6979625/arithmetic-operations-on-r-factors/6980780#6980780

data1 <- rename(data1, CountryCode=X,  Ranking=X.1)
data1$Ranking <- as.numeric(levels(data1$Ranking))[data1$Ranking]

fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
data2 <- read.csv(fileurl, header=TRUE, sep=",")
data2$Region <- as.character(data2$Region)
data2 <- data2 %>% filter(data2$Region != '') 


# Match the data based on the country shortcode.
# How many of the IDs match? Sort the data frame in descending order by 
# GDP rank (so United States is last). What is the 13th country in the 
# resulting data frame?

temp <- merge(data1, data2, by.x="CountryCode", by.y="CountryCode", all=FALSE) %>%
    arrange(desc(Ranking))

temp[13,'Long.Name']

data2[1,'Region']
data2[1:4,'Region']


## Question 4: What is the average 
# GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
## don't need to quote column names
a <- temp %>%
     group_by(Income.Group) %>%
     summarize(mean(Ranking))

## Question 5:
# Cut the GDP ranking into 5 separate quantile groups. 
# Make a table versus Income.Group. How many countries
# are Lower middle income but among the 38 nations with highest GDP?

# seq(start, end, step size)
a <- quantile(temp$Ranking, seq(0,1,0.2), na.rm=TRUE)

temp1 <- temp %>% 
         mutate(Rankgroup=cut(temp$Ranking,a)) %>%
         select(CountryCode, Income.Group, Rankgroup, Ranking)

temp1 %>%
    filter(Income.Group == 'Lower middle income' & Rankgroup =="(1,38.6]") %>%
    View

####################################################################
##                                                                ##
##                     Week 2                                     ##
##                                                                ##
####################################################################

# reading from mySQL
# UCSC 
# use dbConnect to connect to database
install.packages("RMySQL")
library("RMySQL")

ucscDB <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDB, "show databases")
dbDisconnect(ucscDB)

hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
dbListFields(hg19,'affyU133Plus2')
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

query <- dbSendQuesry(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query, n=10)  # get only the top 10 rows
dbClearReasult(query); # need to clear the query running in the database server
dbDisconnect(hg19)

# Question 1:
#
# Register an application with the Github API here https://github.com/settings/applications.
# step to register an application with Github API
# https://github.com/r-lib/httr/blob/master/demo/oauth2-github.r
# Access the API to get information on your instructors repositories
# (hint: this is the url you want "https://api.github.com/users/jtleek/repos").
# this is a xml file, treeparse the file, find datasharing repo
# Use this data to find the time that the datasharing repo was created. What time was it created? ans: "created_at": "2013-11-07T13:25:07Z",


# must run the library for the authentication
install.packages("httpuv")
library(httpuv)
myapp = oauth_app("github", key="5a8a49bd785ba77ceac3", secret="8ff287163d89814d084d4577fc67242af5effe73")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)

read_data = GET("https://api.github.com/users/jtleek/repos", gtoken)
# data is a json file
install.packages("RJSONIO")
library(RJSONIO)
data <- content(read_data)

library(jsonlite)
parsed_data <- jsonlite::fromJSON(toJSON(data))
#answer:
parsed_data[parsed_data$full_name=="jtleek/datasharing","created_at"]



# Question 2:
#
#The sqldf package allows for execution of SQL commands on R data frames.
# We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.

# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?
# read csv file
file <-"PID.csv"
data_file <- paste(file_path,file,sep="")
if (!file.exists(data_file)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileurl, destfile = data)
  dateDownloaded <- date()
}
data <- read.csv(data_file,header=TRUE, sep=",")

install.packages("sqldf")
library(sqldf)
sqldf("select pwgtp1 from data where AGEP <50")


# Question 3:
#
# Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)
sqldf("select distinct AGEP from data")


# Question 4:
#
# Webscraping: Programmatically extractind data from the HTML code of websites
# 
# open a connection to a website
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode


# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
# http://biostat.jhsph.edu/~jleek/contact.html
# (Hint: the nchar() function in R may be helpful)
nchar(htmlCode[10]) #45
nchar(htmlCode[20]) #31
nchar(htmlCode[30]) #7
nchar(htmlCode[100]) #25

# Question 5:
#
# Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
#
#https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

#Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
#(Hint this is a fixed width file format)

#read.fwf : read a table of fixed width formatted data into a data.frame
con = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
data <- read.fwf(con, widths = c(12, 7, 4, 9, 4, 9, 4, 9, 4), skip=4,
                 col.names = c("Week","Nino1_SST","Nino1_SSTA","Nino3_SST","Nino3_SSTA","Nino34_SST","Nino34_SSTA","Nino4_SST","Nino4_SSTA"))

summary(data)
nrow(data)
sum(data$Nino3_SST) # ans: 32426.7

####################################################################
##                                                                ##
##                     Week 1                                     ##
##                                                                ##
####################################################################


# Question 1 & 2
file <-"HID.csv"
data <- paste(file_path,file,sep="")
if (!file.exists(data)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  download.file(fileurl, destfile = data)
  dateDownloaded <- date()
}
input_data <- read.csv(data,header=TRUE, sep=",")

#explore the file
head(input_data)
dim(input_data)

library(dplyr)
#create a data frame tbl from the input_data
input <- tbl_df(input_data)
rm("input_data")


# select a column and columns
select(input, VAL)
# select(inputdata, A:B)

#select(), filter(), arrange(), mutate(), summarize()


# select rows
# How many properties are worth $1,000,000 or more?
# VAL: Property value >= 24 .$1,000,000+
filter(input, VAL==24)
# ans = 53

#Question 3:
#install.packages("xlsx")
#install.packages("XLConnect")
library("xlsx")

file <- "NGAP_1.xlsx"
data <- paste(file_path, file, sep="")
if (!file.exists(data)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
  download.file(fileurl, destfile = data, mode='wb')
}

# Read rows 18-23 and columns 7-15
input_data <- read.xlsx(data, header=TRUE, sheetName="NGAP Sample Data", rowIndex=18:23, colIndex=7:15)

#install.packages("data.table")
#library(data.table)
#input <- data.table(input_data)
#rm(input_data)
dat <- input_data
sum(dat$Zip*dat$Ext,na.rm=T)
# assigne the result to a variable called dat
# what is the value of sum(dat$Zip*dat$Ext,na.rm=T)


# Question 4:
# read xml data
# install.packages("XML")
# install.packages("RCurl")
# use RCrul to read the file into memory
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- getURL(fileURL)

# then parse the file from memory
library(XML)
dat <- xmlTreeParse(doc, useInternal= TRUE)

# explore the xml file
# create a pointer 'rootNode' to the xml document
rootNode <- xmlRoot(dat)  

# in this xml, there is <response> <row> <...observation...> </row></response>
xmlName(rootNode)
names(rootNode)
names(rootNode[[1]][[1]])
#row_data<-getNodeSet(rootNode,"//row")  #yet to find how to put the xml into a dataframe

# ise xPath to locate the data element zipcode, and load it into a data.table, which is a vector
library('data.table')
data <- data.table(zipcode = xpathSApply(rootNode, "//zipcode", xmlValue))

# retrieve the data (xmlValue) tag with zip code
data[2:3]  #view the 2nd to 3rd value of the vector
data[1, zipcode]


# select only zip code = 21231
# how many resturants have zip code 21231?
sum(data[, zipcode==21231])



# Question 5: 
file <- "PID.csv"
data_file <- paste(file_path, file, sep="")
if (!file.exists(data_file)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  download.file(fileurl, destfile=data_file)
}

DT <- fread(data_file)

tables()

#use fread() to load the data into R object DT
# which of the following ways is the fastest to find 

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
# extract data into 2 list: observation for DT$SEX = 1 and DT$SEX = 2; then calculate the mean of each list

system.time(DT[,mean(pwgtp15),by=SEX])  ## winner??
# take the mean of pwgTP15 when sex =1, place the value in all the rows with sex = 1
# do the same for sex = 2
# subsetting DT, use all rows, select & calculate the mean of pwgtp15 by SEX
# google: subsetting with expression

system.time(tapply(DT$pwgtp15,DT$SEX,mean))  
#tapply : take the vector $DT$pwgtp15, calculate the mean group value = DT$SEX


system.time(rowMeans(DT)[DT$SEX==1], rowMeans(DT)[DT$SEX==2])
# split the DT into 2 groups by tagger true/false, calculate all the mean of each group
# there could be some variable is not numeric in the dataset
# slowest



system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15))
# select the observation to (sex, pwgtp15), and calculate mean
# taging the observation to True/False and calculate


