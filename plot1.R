#Reading in the data and subsetting
d <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
d <- subset(d , d$Date == "1/2/2007" | d$Date == "2/2/2007")

#Setting global graphics option(s)
par(mfrow=c(1,1))

#Creating the plot
with(d, hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))

#Creating png
#By default creates in 480x480 pixel format
dev.copy(png, file="plot1.png")
dev.off()