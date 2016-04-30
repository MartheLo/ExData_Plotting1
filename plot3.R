# Reading data
powconsum <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
str(powconsum)
library(dplyr)
powconsum$Date = as.Date(powconsum$Date, format = "%d/%m/%Y")
str(powconsum)
powconsum.f <- filter(powconsum, Date == "2007-02-01" | Date == "2007-02-02")
str(powconsum.f)

# Making plot3.png
powconsum.f$timestamp <- as.POSIXlt(paste(powconsum.f$Date, powconsum.f$Time, sep = " "))
head(powconsum.f)

dev.new(width = 480, hight = 480)
plot(powconsum.f$timestamp, powconsum.f$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
points(powconsum.f$timestamp, powconsum.f$Sub_metering_2, col = "red", type = "l")
points(powconsum.f$timestamp, powconsum.f$Sub_metering_3, col = "blue", type = "l")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()


