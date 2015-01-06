## download file from website. Note https doesnt work
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip", "household_power_consumption.txt")

## read it in and subset it
powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )

## clean up
file.remove("data.zip")
file.remove("household_power_consumption.txt")

##plot4
## here the 504x504 (file we are supposed to match) vs 480x480 (file we are supposed to produce) mismatch
## really becomes annoying; so I offer two variants: a 504x504 version that is a very close; and a best attempt
## at 480x480 (here the sizes of the little graphs match the model, but the spacing is tighter)

png(file = "plot4.png", width = 504, height = 504, bg = "transparent")
par(mfrow = c(2, 2), mar = c(5.5, 4.5, 4, 2))
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

png(file = "plot4a.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2), mar = c(4.8, 3.8, 3.3, 1))
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