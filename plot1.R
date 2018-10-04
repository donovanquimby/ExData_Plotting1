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

# Plot histograme of Global Active Power
 
png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = 'red', main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()




        
