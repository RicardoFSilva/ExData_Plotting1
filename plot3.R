# Plot 3

library(data.table)

if(!file.exists("household_power_consumption.txt"))
{
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip", mode = "wb")

        unzip("exdata_data_household_power_consumption.zip")
}

data <- subset(read.table("household_power_consumption.txt", header=T, sep=";", na.strings=c('?')), Date=="1/2/2007" | Date=="2/2/2007")
# data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")

plot(data$Sub_metering_1, type="l", axes=F, xlab="", ylab="Energy sub metering", col="black")
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")

axis(1, at=c(1, nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright", pch = 151, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
