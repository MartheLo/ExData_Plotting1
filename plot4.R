# Reading data
powconsum <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
str(powconsum)
library(dplyr)
powconsum$Date = as.Date(powconsum$Date, format = "%d/%m/%Y")
str(powconsum)
powconsum.f <- filter(powconsum, Date == "2007-02-01" | Date == "2007-02-02")
str(powconsum.f)

# Making plot4.png
powconsum.f$timestamp <- as.POSIXlt(paste(powconsum.f$Date, powconsum.f$Time, sep = " "))
head(powconsum.f)

dev.new(width = 480, hight = 480)
par(mfrow = c(2, 2))

#part1
plot(powconsum.f$timestamp, powconsum.f$Global_active_power, ylab = "Global Active Power (kilwatts)", xlab = "", type = "l")

#part2
plot(powconsum.f$timestamp, powconsum.f$Voltage, ylab = "Voltage", xlab = "datatime", type = "l")

#part3
plot(powconsum.f$timestamp, powconsum.f$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
points(powconsum.f$timestamp, powconsum.f$Sub_metering_2, col = "red", type = "l")
points(powconsum.f$timestamp, powconsum.f$Sub_metering_3, col = "blue", type = "l")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#part4
plot(powconsum.f$timestamp, powconsum.f$Global_reactive_power, ylab = "Gloabl_relative_power", xlab = "datatime", type = "l")

dev.copy(png, file = "plot4.png")
dev.off()


