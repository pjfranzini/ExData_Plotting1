##setwd("~/Dropbox/MacDocuments/programming/R/Coursera data track/exploratoryDA/week1 Ex/ExData_Plotting1")
##list.files()

##powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
##powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )
##hist(powerC$Global_active_power)
## this was doing things locally;
## now find a way to read in file from web, unzip it, use it, erase it
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip", "household_power_consumption.txt")
powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )
file.remove("data.zip")
file.remove("household_power_consumption.txt")


##xlim = c(0, 9), ylim = c(0,1200)  -- not needed here

##plot1
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
## note that example file is 504 x 504 pixel while we were told to make 480x480
## so exact correspondence is a bit confusing

##  cex.lab=0.75, cex.main=0.95, cex.axis = .75  -- not needed for png version
par(mar = c(4.5, 3.8, 3, 1)) ## without this graph is a bit smaller than the one we are to match
hist(powerC$Global_active_power, col = "red",
     main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)",
     breaks = 15, axes = FALSE )

axis(side = 1, at = c(0, 2, 4, 6) )
axis(side = 2, at = c(0,200, 400, 600, 800, 1000, 1200))
dev.off()

##plot2
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
par(mar = c(4.5, 3.8, 3, 1)) ## without this graph is a bit smaller than the one we are to match
with(powerC,  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
     type = "l", 
     xlab="", ylab="Global Active Power (kilowatts)" ))
dev.off()

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

##plot4
png(file = "plot4.png", width = 504, height = 504, bg = "transparent")
par(mfrow = c(2, 2), mar = c(4.3, 3.8, 3, 1))
with(powerC, {
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
                     type = "l",
                     xlab="", ylab="Global Active Power" )
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Voltage,
                     type = "l",
                     xlab="datetime", ylab="Voltage" )
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1,
                     type = "l",
                     xlab="", ylab="Energy sub metering" )
  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red", type = "l")
  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue", type = "l")
  legend("topright",  col = c("black", "red", "blue"), lwd = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        bty = "n")
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power,
       type = "l",
       xlab="datetime", ylab="Global_reactive_power" )
})
dev.off()