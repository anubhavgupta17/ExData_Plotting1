#Reading in the data and subsetting
d <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
d <- subset(d , d$Date == "1/2/2007" | d$Date == "2/2/2007")
d$dateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

#Setting global graphics option(s)
#sets the parameter to create 2 plots per row and 2 plots per column = 4 plots in total
par(mfrow=c(2,2))
par(cex=0.55)

#First plot: Global Active Power vs dateTime
with(d, plot(dateTime, Global_active_power, ylab="Global Active Power", xlab=" ", type="l"))


#Second plot: Voltage vs dateTime
with(d, plot(dateTime, Voltage, ylab="Voltage", xlab="datetime", type="l"))

#Third Plot: Energy Sub Metering vs datetime
with(d, plot(dateTime, Sub_metering_1, ylab="Energy sub metering", xlab=" ", type="l"))
with(d, points(dateTime, Sub_metering_2, col="red", type="l"))
with(d, points(dateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", legend = leg.txt, col = c("black", "red", "blue"), lty=c(1,1,1), bty="n")

#Fourth Plot: Global_reactive_power vs datetime
with(d, plot(dateTime, Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l"))

#Creating png
#By default creates in 480x480 pixel format
dev.copy(png, file="plot4.png")
dev.off()