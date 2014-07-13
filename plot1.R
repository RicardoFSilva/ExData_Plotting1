# Plot 1

library(data.table)

if(!file.exists("household_power_consumption.txt"))
{
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip", mode = "wb")

        unzip("exdata_data_household_power_consumption.zip")
}

data <- subset(read.table("household_power_consumption.txt", header=T, sep=";", na.strings=c('?')), Date=="1/2/2007" | Date=="2/2/2007")
# data$DateTime <- strptime(paste(data$Date, data$Time), "%m/%d/%Y %H:%M:%S")

png(file="plot1.png")

hist(data$Global_active_power, plot=TRUE, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")

dev.off()
