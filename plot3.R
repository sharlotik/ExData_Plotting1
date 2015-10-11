## Plot 3

## download dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "Electric_Power_Consumption.zip", mode = "wb")

## unzip and make subsetting
dataset_unz <- unzip("Electric_Power_Consumption.zip")
dataset_total <- read.table(dataset_unz, sep = ";", header = TRUE, na.strings = "?" )
dataset <- dataset_total[as.Date(dataset_total$Date, "%d/%m/%Y") >= "2007-02-01" & 
                                 as.Date(dataset_total$Date, "%d/%m/%Y") <= "2007-02-02", ]

## create a new variable with data and time

date_time <- paste(as.Date(dataset$Date, "%d/%m/%Y"), dataset$Time)
dataset$date_time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")

## plot graphics and write into file

png("plot3.png", width = 480, height = 480, units = "px", type = "windows")
plot(dataset$date_time, dataset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(dataset$date_time, dataset$Sub_metering_2, type = "l", col = "red")
lines(dataset$date_time, dataset$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1) , col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()