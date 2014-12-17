#Project2 - Plot1

# Read files


NEI <- readRDS("~/R/work/project2/summarySCC_PM25.rds")

SCC <- readRDS("~/R/work/project2/Source_Classification_Code.rds")
#Aggregate 
 
 Emissions <- aggregate(NEI[,"Emissions"], by = list(NEI$year), FUN = sum)
 Emissions$PM <- round(Emissions[,2]/1000, 2)

#Saving to file
 png(filename= "plot1.png")

#Plotting

 barplot(Emissions$PM, names.arg = Emissions$Group.1,
         main = expression("Total Emission of PM" [2.5]), xlab = "Year",
         ylab = expression(paste("PM",""[2.5],"in Kilotons")))

#Release Graphic Device

 dev.off()
