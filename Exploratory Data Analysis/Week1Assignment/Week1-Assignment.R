

#Step 0. downolaod the zip file, read the raw data & prep data for plot
temp <- tempfile()
temp2 <-tempfile()


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
unzip(temp,list=TRUE)
unzip(zipfile=temp, exdir=temp2)

input_data <- read.csv(file.path(temp2,'household_power_consumption.txt',fsep='\\'),
                 sep=";", stringsAsFactors = FALSE)

library(lubridate)
input_data$Date <- dmy(input_data$Date)
input_data <- input_data[(input_data$Date >= '2007-02-01' & input_data$Date <= '2007-02-02'),]

input_data$Time <- hms(input_data$Time)
input_data$DateTime <- input_data$Date + input_data$Time

input_data$Global_active_power <- as.numeric(input_data$Global_active_power)
input_data$Sub_metering_1 <- as.numeric(input_data$Sub_metering_1)
input_data$Sub_metering_2 <- as.numeric(input_data$Sub_metering_2)
input_data$Sub_metering_3 <- as.numeric(input_data$Sub_metering_3)
input_data$Voltage <- as.numeric(input_data$Voltage)
input_data$Global_reactive_power <- as.numeric(input_data$Global_reactive_power)


## Plot1.R
hist(input_data$Global_active_power, col='red',
     xlab="Global Active Power(kilowatts)",
     main = 'Global Active Power')

## Plot2.R
# names(par())
plot(input_data$DateTime, input_data$Global_active_power,type="l",
        ylab="Global Active Power(kilowatts)", xlab="")


## Plot3.R
par(mfrow=c(1,1))
plot(input_data$DateTime, input_data$Sub_metering_1,
     type="l",col='black', ylab='Energy sub metering')
lines(input_data$DateTime, input_data$Sub_metering_2, col='red')
lines(input_data$DateTime, input_data$Sub_metering_3, col='blue')
legend('topright', cex=1,
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1,1),
       col=c('black','red','blue'))

## Plot4.R
par(mfrow = c(2,2))

### top left
plot(input_data$DateTime, input_data$Global_active_power,type="l",
     ylab="Global Active Power(kilowatts)", xlab="")

### top right
plot(input_data$DateTime, input_data$Voltage,type="l",
     ylab="Voltage", xlab="datetime")

### bottom left
plot(input_data$DateTime, input_data$Sub_metering_1,
     type="l",col='black', ylab='Energy sub metering')
lines(input_data$DateTime, input_data$Sub_metering_2, col='red')
lines(input_data$DateTime, input_data$Sub_metering_3, col='blue')
legend('topright', cex=0.5,
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1,1),
       col=c('black','red','blue'))

### bottom right
plot(input_data$DateTime, input_data$Global_reactive_power,type="l",
     ylab="Global Reactive Power", xlab="datetime")
