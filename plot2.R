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
# plot2

plot(subData$Global_active_power ~ subData$DateTime, type= "l", ylab= "Global Active Power(kilowatts", xlab="")
# saving to file
dev.copy(png, file="plot2.png", height =480, width= 480)
# release device
dev.off()


