# Reading data
powconsum <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
str(powconsum)
library(dplyr)
powconsum$Date = as.Date(powconsum$Date, format = "%d/%m/%Y")
str(powconsum)
powconsum.f <- filter(powconsum, Date == "2007-02-01" | Date == "2007-02-02")
str(powconsum.f)

# Making plot2.png
powconsum.f$timestamp <- as.POSIXlt(paste(powconsum.f$Date, powconsum.f$Time, sep = " "))
head(powconsum.f)

dev.new(width = 480, hight = 480)
plot(powconsum.f$timestamp, powconsum.f$Global_active_power, ylab = "Global Active Power (kilwatts)", xlab = "", type = "l")
dev.copy(png, file = "plot2.png")
dev.off()


