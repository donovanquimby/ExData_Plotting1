# -*- coding: utf-8 -*-
# 
library(downloader)
library(dplyr)
library(hms)

# get working directory path
wd <- getwd()

# Download required files and data if not already in wd
urlData <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
URlCode <- "https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption"


if(!file.exists("./dataset.zip")){download(urlData, dest="dataset.zip", mode = "wb")
        unzip("dataset.zip")}

if(!file.exists("codebook.html")){download(URlCode, dest="codebook.html")}

fname <- "household_power_consumption.txt"

# create data tables for all files in "filenames" from above

data <- read.table(fname, header =TRUE, na.strings = c("?"), sep = ";",
                   stringsAsFactors = FALSE)


data$Date <- as.Date(data$Date, format = "%d/%m/%Y" )

data <- filter(data, between(Date, as.Date('2007-02-01'),
                             as.Date('2007-02-02')))

data$Date <- as.POSIXct(paste0(data2$Date, data2$Time))



# Plot 

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#plot 1,1
plot(data$Date, data$Global_active_power, type = "l", col = "black", 
     ylab = "Global Active Power)" ,xlab = "")

# plot 1,2
plot(data$Date, data$Voltage, type = "l", col = "black", 
     ylab = "Voltage" ,xlab = "datetime")

# plot 2,1
plot(data$Date, data$Sub_metering_1, type = "l", col = "black", 
     ylab = "Energy sub metering" ,xlab = "")
lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col = c("black","red","blue"))

# plot 2,2
plot(data$Date, data$Global_reactive_power, type = "l", col = "black", 
     ylab = "Global_reactive_power" ,xlab = "datetime")


dev.off()
