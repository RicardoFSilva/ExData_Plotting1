# Plot 2

library(data.table)

if(!file.exists("household_power_consumption.txt"))
{
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "exdata_data_household_power_consumption.zip", mode = "wb")

        unzip("exdata_data_household_power_consumption.zip")
}

data <- subset(read.table("household_power_consumption.txt", header=T, sep=";", na.strings=c('?')), Date=="1/2/2007" | Date=="2/2/2007")
# data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")

plot(data$Global_active_power, type="l", axes=F, xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
axis(2)
box()

dev.off()
