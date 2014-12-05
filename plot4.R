#Getting all Data

allData <- read.csv("~/R_work/data/household_power_consumption.txt", header=T, sep=";", na.strings="?",
           nrows= 2075259, check.names=F, stringsAsFactors=F, comment="", quote='\"')

# Subsetting Data

 allData$Date <- as.Date(allData$Date,format= "%d/%m/%Y")
 subData <- subset(allData, subset= (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Removing all Data
 rm (allData)

#Converting Dates into Date and Time

 date.time <- paste(as.Date(subData$Date), subData$Time)
 subData$DateTime <- as.POSIXct(date.time)

# Create plot4 on screen device

par(mfrow = c(2,2), mar=c(4,4,2,1),oma= c(0,0,2,0))
with (subData, {
 	plot(Global_active_power ~DateTime,type 	="1",ylab="Global Active Power(kilowatts)",xlab="")

 	plot(Voltage ~ DateTime, type="l", 	ylab="Voltage(volt)", xlab="")

 	plot(Sub_metering_1 ~DateTime, type="l",ylab= 	"Global 	Active Power(kilowatts)", xlab="")

 	lines(Sub_metering_2 ~ DateTime, col= "Red")
 	lines(Sub_metering_3 ~ DateTime, col= "blue")

  legendText= c(Sub_metering_1,Sub_metering_2, 	Sub_metering_3)

 	legend("topright", legendText, col=c("black", "red", "blue"), lty =c(1,1), lwd= c(2.5,2.5),
 	         cex=0.75, bty="n")
 
	plot(Global_reactive_power ~DateTime, 	type="l",ylab="Global Reactive Power(kilowatts)", 	xlab= "")
 })

# Copy plot4 to a PNG file
dev.copy(png, file="plot4.png", height=600, width=600, unit="px", pointsize=12, bg="transparent")

#Close the PNG device
dev.off()

