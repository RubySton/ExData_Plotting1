 #Project2 - Plot2
 
 # Read files
 
 
NEI <- readRDS("~/R/work/project2/summarySCC_PM25.rds")

SCC <- readRDS("~/R/work/project2/Source_Classification_Code.rds")

# Subsets data

MD <- NEI[NEI$fips=="24510",]


#Saving to file
png(filename= "plot2.png")
#Plotting data

barplot( tapply( MD$Emissions, MD$year, sum), main ="Total Emission in Baltimore City, MD",
         xlab= "Year", ylab= expression("PM"[2.5]))
        
#Release graphic device
dev.off()
