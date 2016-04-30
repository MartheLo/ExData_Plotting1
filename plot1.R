# Reading data
powconsum <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
str(powconsum)
library(dplyr)
powconsum$Date = as.Date(powconsum$Date, format = "%d/%m/%Y")
str(powconsum)
powconsum.f <- filter(powconsum, Date == "2007-02-01" | Date == "2007-02-02")
str(powconsum.f)

# Making plot1.png
dev.new(width = 480, hight = 480)
hist(powconsum.f$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()