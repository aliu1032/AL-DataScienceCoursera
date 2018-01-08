#rm(list=ls())
getwd()
setwd("~/LearnR/Basic R")

file_path <-"C:/Users/April/Documents/LearnR/Basic R/"

####################################################################
##                                                                ##
##                     Week 1                                     ##
##                                                                ##
####################################################################

# read.table
file <- 'hw1_data.csv'
data <- read.table(paste(c(file_path,file),collapse=""), header=TRUE,sep=",")
# classes <= sapply(initial, class)
# read.table("file", colClasses = classes)

print (cat("Names of data column: ", names(data), "\n"))

print ("first 2 rows")
data[1:2,]

# last 2 rows
data[152:153,]
tail(data,2)
data[-seq(2),]

data$Ozone[47]
sum(is.na(data$Ozone))
mean(data$Ozone, na.rm=TRUE)

#Extract a subset of rows where Ozone>31 and Temp >90, what is the mean of Solor.R
# remember the comma at the end
temp <- data[data$Ozone > 31 & data$Temp> 90,]
temp2 <- data[data$Ozone > 31 & data$Temp> 90, 'Solar.R']
mean(temp2, na.rm=TRUE)

# what is the mean of Temp when Month = 6
mean(data[data$Month==6,'Temp'], na.rm=TRUE)

#what is the max of Ozone value when month = 5
max(data[data$Month==5,'Ozone'], na.rm=TRUE)

# read.csv
# stringsasfactor


####################################################################
##                                                                ##
##                     Week 2                                     ##
##                                                                ##
####################################################################

add2 <- function (x, y) {
  x+y
}
# implict return the result of the last expression in the function

above_n <- function(x, n=10) {
  use <- x>n
  x[use]
}

above_n(c(1:20))



## environment
search()
# to find what environment and namespace sequence
# when user load the library, it always insert to position 2

# different namespaces for functions and variables
# lexical Scoping (aka static scoping)
# constructing function
# free variable, variable is not defined in the function argument and not local variables (i.e assigned inside the function)

# to find the function environment
# ls(environment(variable_name))

#You can use the `&` operator to evaluate AND across a vector. The `&&` version of AND only evaluates the first member of a vector.
#| Let's test both for practice. Type the expression TRUE & c(TRUE, FALSE, FALSE).


ints <- seq(1:20)
which(ints >6)
any(ints>3)
all(ints<4)

time <- Sys.time()
str(unclass(time))
time$min
weekdays(time)


t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")


pollutantmean <- function( directory, pollutant, id=1:332){
    folder = paste(getwd(),'/', directory,"/", sep="")
    data <- read.table(paste(folder,sprintf('%03i',id[1]),'.csv',sep=''), header=TRUE, sep=",")
    
    for (i in seq(from=2, to=length(id)-1, by=1)) {
        input <- read.table(paste(folder,sprintf('%03i',i),'.csv',sep=''), header=TRUE, sep=",")
        data = rbind(data,input)
    }
    mean(data[,pollutant], na.rm=TRUE)
}

complete <- function(directory, id=1:332) {
    folder = paste(getwd(),'/', directory,"/", sep="")
    output <- data.frame(id=numeric(0), nobs=numeric(0))
    
    for (i in seq(length(id))) {
        data <- read.table(paste(folder,sprintf('%03i',id[i]),'.csv',sep=''), header=TRUE, sep=",")
        
        ## remember to put a comma to the subset to subset a row
        count=0
        for (j in seq(nrow(data))) {
            count = count + !anyNA(data[j,])
        }
        output <- rbind(output,c(i,count))
    }
    names(output) <- c('id','nobs')
    output
}

corr <- function (directory, threshold = 0) {
    folder = paste(getwd(),'/', directory,"/", sep="")
    file_list <- list.files(folder)
    ans <- c()
    
    for (i in seq(file_list)) {
        print(i)
        
        #test if the number of valid observation meet the threshold requirement
        valid_obs <- complete(directory, i)$nobs > threshold
         
        if (valid_obs) {
            data <- read.table(paste(folder,file_list[i],sep=''), header=TRUE, sep=",")
            ans <-c(ans, cor(data$sulfate,data$nitrate,use='complete.obs'))
        }
    }
    ans
}
########################
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


####################################################################
##                                                                ##
##                     Week 3                                     ##
##           split - apply - combine                              ##
####################################################################

# loop functions
# lapply: loop over a list of something, apply the function to every object
#         return a list
# tapply loop over a subsets of vector
# Sapply return a 'simplified' lapply result (ie combine the multiple list object in a vector)
# apply
# mapply: input multiple list to the different input variable of a funtion
# split


# Question 1
# library(datasets)
# data("iris")
# ?iris

#There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' 
#for the species virginica? Please round your answer to the nearest whole number.

#unique(iris$Species)

a <- split(iris$Sepal.Length, iris$Species)  #split the sepal length by speciies
sapply(a, mean) # = 7

# Question 2
# Continuing with the 'iris' dataset from the previous Question,
# what R code returns a vector of the means of the variables 
# 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

apply(iris[,1:4],2,mean)


# Question 3
# load mtcars
data("mtcars")

# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
# Select all that apply.

# number of cylinders in the cars (cyl)
class(mtcars$cyl)
cyl_factor <- factor(mtcars$cyl)
range(mtcars$cyl)
unique(mtcars$cyl)

tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg,mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))

# Question 4
# Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between
# the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

a <- tapply(mtcars$hp, mtcars$cyl,mean)
a[3]-a[1]  # = 127
