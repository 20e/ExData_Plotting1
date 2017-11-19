#preparation
library(ggplot2)
library(lubridate)
library(dplyr)
#check the size of the txt file
msize<-round(file.size("household_power_consumption.txt")/(2^20))
line<-paste("This file is ",msize," MB.")
line
#load the data
data<-read.table("household_power_consumption.txt",sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=66637,nrows=2880,na.strings = "?")
#change the class of Date and Time
data$"Date"<-as.Date(data$"Date","%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
Sys.setlocale(category = "LC_ALL", locale = "C")
#open device
png(filename = 'plot4.png', width = 960, height = 960, units='px')
#plot
par(mfcol=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1:1,col=c("black","red","blue"),cex = 1)
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#save the png file
dev.off()
#check the png file
list.files()