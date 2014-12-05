# Getting all Data
              
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

# plotting Data

 with (subData, {
	 plot(Sub_metering_1 ~DateTime, type="l", ylab="Global Active Power(kilowatts)", xlab="")
 	lines(Sub_metering_2 ~ DateTime, col= "Red")
 	lines(Sub_metering_3 ~ DateTime, col= "blue")
 })
 legendText= c("Sub_metering_1", "Sub_metering_2", 	"Sub_metering_3")

 legend("topright", legendText, col=c("black", "red", "blue"), lty =1, 	lwd=2)

  #Saving plot3 to a PNG file

 dev.copy(png, file="plot3.png", height= 480, width=480)
 
 # close the PNG device 
 dev.off()
