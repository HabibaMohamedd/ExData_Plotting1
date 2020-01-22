##to know my directory
getwd()
##to change directory 
setwd("F:/Habeba/Data Science/Slides/Explorating/Week1/Assignment")
##to read data set and specify parameters like separation between columns by ; 
dataset_household <- read.table("household_power_consumption.txt", header = TRUE , sep = ";" , dec = "." , stringsAsFactors = FALSE)
##to get summary of data and know classes for each column
summary(dataset_household)
##to create subset of data and create new dataset 
subset_household <- subset(dataset_household , dataset_household$Date == "1/2/2007" | dataset_household$Date == "2/2/2007" , select = Date:Sub_metering_3)
##to change data class from character to numeric
Global_active_power <- as.numeric(subset_household$Global_active_power)
Global_reactive_power <- as.numeric(subset_household$Global_reactive_power)
Voltage <- as.numeric(subset_household$Voltage)
Global_intensity <- as.numeric(subset_household$Global_intensity)
Sub_metering_1 <- as.numeric(subset_household$Sub_metering_1)
Sub_metering_2 <- as.numeric(subset_household$Sub_metering_2)
Sub_metering_3 <- as.numeric(subset_household$Sub_metering_3)
## format date and time using strptime
datewithtime <- strptime(paset(subset_household$Date , subset_household$Time, sep= " ") , format = "%d/%m/%Y %H:%M:%S")
##for creating fourth plot by adding 4 plots together 
par(mfrow = c(2, 2)) 
plot(datewithtime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(datewithtime, Sub_metering_1 , type = "l" , ylab = "Energy sub metering")
lines(datewithtime , Sub_metering_2 , type="l" , col="red")
lines(datewithtime , Sub_metering_3 , type="l" , col="blue")
plot(datewithtime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
dev.copy(png , file = "plot4.png")
dev.off()
