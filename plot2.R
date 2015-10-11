## Plot 2

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

## plot graphic and write into file

png("plot2.png", width = 480, height = 480, units = "px", type = "windows")
plot(dataset$date_time, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()