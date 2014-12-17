#Project2 - Plot6
  

 library(ggplot2)
# Read files  
 
NEI <- readRDS("~/R/work/project2/summarySCC_PM25.rds")
 
SCC <- readRDS("~/R/work/project2/Source_Classification_Code.rds")
 
NEI$year <- factor(NEI$year, levels = c("1999", "2002", "2005", "2008"))

# Baltimore City, Maryland 
#Los Angles County, California

MD.onroad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
CA.onroad <- subset(NEI, fips == "06037" & type == "ON-ROAD")
 
 # Aggregate the Data a bout two cities
 
 MD.df <- aggregate(MD.onroad[, "Emissions"], by = list(MD.onroad$year),sum)
colnames(MD.df) <- c("year", "Emissions")
MD.df$City <- paste(rep("MD", 4))

CA.df <- aggregate(CA.onroad[, "Emissions"], by = list(CA.onroad$year),sum)
colnames(CA.df) <- c("year", "Emissions")
CA.df$City <- paste(rep("CA", 4))

DF <- rbind(MD.df, CA.df)

 # save to png file
 png("plot6.png")
 
 # plotting data
ggplot(data = DF, aes(x = year, y = Emissions))+
geom_bar(aes(fill = year),stat = "identity")+
guides(fill = F)+
ggtitle("Motor Vehicle Emissions in Baltimore City.MD vs. Los Angeles.CA")+
ylab(expression("PM"[2.5]))+
xlab ("Year")+
theme(legend.position = "none")+
facet_grid(.~ City)+
geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = -1))
 
 # release device
 dev.off()
