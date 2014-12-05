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

# Plotting subData (plot1)
  
 hist(subData$Global_active_power, main= "Global Active Power", xlab ="Global Active Power(kilowatts)", 
      ylab= "Frequency", col="Darkred")

# Saving plot into png file
 dev.copy(png, file= "plot1.png", height= 480, width=480)

# Release Graphic device
dev.off()
==========================================
