setwd("~/Dropbox/MacDocuments/programming/R/Coursera data track/exploratoryDA/week1 Ex/ExData_Plotting1")
list.files()

powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )
hist(powerC$Global_active_power)

##xlim = c(0, 9), ylim = c(0,1200)  -- not needed here

##plot1
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
## note that example file is 504 x 504 pixel while we were told to make 480x480
## so exact correspondence is a bit confusing

##  cex.lab=0.75, cex.main=0.95, cex.axis = .75  -- not needed for png version
par(mar = c(4.5, 4, 4, 1)) ## without this graph is a bit smaller than the one we are to match
hist(powerC$Global_active_power, col = "red",
     main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)",
     breaks = 15, axes = FALSE )

axis(side = 1, at = c(0, 2, 4, 6) )
axis(side = 2, at = c(0,200, 400, 600, 800, 1000, 1200))
dev.off()

##plot2
with(powerC,  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
     type = "l", cex.lab=0.75, cex.axis = .75,
     xlab="", ylab="Global Active Power (kilowatts)" ))

##plot3
with(powerC,  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1,
                   type = "l", cex.lab=0.75, cex.axis = .75,
                   xlab="", ylab="Energy sub metering" ))

with(powerC,  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red", type = "l"))
with(powerC,  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue", type = "l"))

legend("topright",  col = c("black", "red", "blue"), lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = .75)

##plot4
par(mfrow = c(2, 2), mar = c(4, 1, 4, 0)) 
with(powerC, {
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
                     type = "l", cex.lab=0.75, cex.axis = .75,
                     xlab="", ylab="Global Active Power" )
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Voltage,
                     type = "l", cex.lab=0.75, cex.axis = .75,
                     xlab="datetime", ylab="Voltage" )
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_1,
                     type = "l", cex.lab=0.75, cex.axis = .75,
                     xlab="", ylab="Energy sub metering" )
  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red", type = "l")
  points(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue", type = "l")
  legend("topright",  col = c("black", "red", "blue"), lwd = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         cex = .9, bty = "n")
  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power,
       type = "l", cex.lab=0.75, cex.axis = .75,
       xlab="datetime", ylab="Global_reactive_power" )
  
})