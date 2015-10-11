## Plot 1

## download dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "Electric_Power_Consumption.zip", mode = "wb")

## unzip and make subsetting
dataset_unz <- unzip("Electric_Power_Consumption.zip")
dataset_total <- read.table(dataset_unz, sep = ";", header = TRUE, na.strings = "?" )
dataset <- dataset_total[as.Date(dataset_total$Date, "%d/%m/%Y") >= "2007-02-01" & 
                                 as.Date(dataset_total$Date, "%d/%m/%Y") <= "2007-02-02", ]

## plot histogtam and write into file

png("plot1.png", width = 480, height = 480, units = "px", type = "windows")
hist(dataset$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()

