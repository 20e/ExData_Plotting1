#preparation
library(ggplot2)
#check the size of the txt file
msize<-round(file.size("household_power_consumption.txt")/(2^20))
line<-paste("This file is ",msize," MB.")
line
#load the data
data<-read.table("household_power_consumption.txt",sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),skip=66637,nrows=2880,na.strings = "?")
#change the class of Date and Time
data$"Date"<-as.Date(data$"Date","%d/%m/%Y")
#plot the histgram
hist(data$"Global_active_power",col="red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
#save the png file
dev.copy(png,file="plot1.png")
dev.off()
#check the png file
list.files()