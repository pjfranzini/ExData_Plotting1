## download file from website. Note https doesnt work
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip", "household_power_consumption.txt")

## read it in and subset it
powerC <- read.csv("./household_power_consumption.txt", header=TRUE,  sep=";", na.strings = "?")
powerC <- subset(powerC, Date == "1/2/2007" | Date == "2/2/2007" )

## clean up
file.remove("data.zip")
file.remove("household_power_consumption.txt")

##plot1
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
## note that example file is 504 x 504 pixel while we were told to make 480x480
## so exact correspondence is a bit confusing

par(mar = c(4.5, 3.8, 3, 1)) ## without this graph is a bit smaller than the one we are to match
hist(powerC$Global_active_power, col = "red",
     main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)",
     breaks = 15, axes = FALSE )

axis(side = 1, at = c(0, 2, 4, 6) )
axis(side = 2, at = c(0,200, 400, 600, 800, 1000, 1200))
dev.off()

