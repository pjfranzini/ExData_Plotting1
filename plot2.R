## download file from website. Note https doesnt work
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip", "household_power_consumption.txt")

## read it in and subset it
powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )

## clean up
file.remove("data.zip")
file.remove("household_power_consumption.txt")

##plot2
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
par(mar = c(4.5, 3.8, 3, 1)) ## without this graph is a bit smaller than the one we are to match
with(powerC,  plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power,
                   type = "l", 
                   xlab="", ylab="Global Active Power (kilowatts)" ))
dev.off()