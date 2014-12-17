#Project2 - Plot3
 
 # Read files
 
 
NEI <- readRDS("~/R/work/project2/summarySCC_PM25.rds")

SCC <- readRDS("~/R/work/project2/Source_Classification_Code.rds")

# Subsets data

MD <- NEI[NEI$fips=="24510",]
MD$year <- factor(MD$year,levels = c("1999", "2002", "2005", "2008"))

#Saving to file
png("plot3.png", width = 800, height= 500, units= "px")
#Plotting data
library(ggplot2)

ggplot(data = MD, aes(x = year, y = log(Emissions)))
+ facet_grid(.~type)
+ guides(fill= F)+ geom_boxplot(aes(fill = type))
+ stat_boxplot(geom ="errorbar")
+ ylab (expression(paste("Log", "of PM25, Emissions")))+ xlab("Year")
+ ggtitle("Emissions per Type in Baltimore City, Maryland")+ geom_jitter(alpha = 0.10)
#  Release device
dev.off()

