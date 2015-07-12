#Reading in the data and subsetting
d <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
d <- subset(d , d$Date == "1/2/2007" | d$Date == "2/2/2007")
d$dateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

#Setting global graphics option(s)
par(mfrow=c(1,1))

#Creating the plot
with(d, plot(dateTime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab=" ", type="l"))

#Creating png
#By default creates in 480x480 pixel format
dev.copy(png, file="plot2.png")
dev.off()