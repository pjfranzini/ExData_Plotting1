## download file from website. Note https doesnt work
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip", "household_power_consumption.txt")

## read it in and subset it
powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )

## clean up
file.remove("data.zip")
file.remove("household_power_consumption.txt")

##plot3
png(file = "plot3.png", width = 480, height = 480, bg = "transparent")
par(mar = c(4.5, 3.8, 3, 1)) ## without this graph is a bit smaller than the one we are to match
with(powerC,  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1,
                   type = "l",
                   xlab="", ylab="Energy sub metering" ))

with(powerC,  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red", type = "l"))
with(powerC,  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue", type = "l"))

legend("topright",  col = c("black", "red", "blue"), lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()