#Project2 - Plot4
 
 # Read files
library(ggplot2)
 
 
NEI <- readRDS("~/R/work/project2/summarySCC_PM25.rds")

SCC <- readRDS("~/R/work/project2/Source_Classification_Code.rds")

#Coal-related SCC
SCC.coal = SCC[grepl("coal",SCC$Short.Name, ignore.case =TRUE),]

#Merge two datasets
merged <- merge(x = NEI, y = SCC.coal, by = "SCC")
merged.sum <- aggregate(merged[,"Emissions"], by = list(merged$year), sum)
colnames(merged.sum)<- c("Year", "Emissions")

#save plot to png file
png(filename = "plot4.png")
# plotting data
ggplot(data = merged.sum, aes(x = Year, y = Emissions/1000))+
geom_line(aes(group = 1, col = Emissions))+
geom_point(aes(size = 2, col = Emissions))+
ggtitle(expression("Total Emissions of PM"[2.5]))+
ylab(expression(paste("PM", ""[2.5] ,"in kilotons")))+
geom_text(aes(label= round(Emissions/1000, digits = 2), size= 2, 
              hjust = 1.5, vjust = 1.5))+
theme(legend.position = "none")+
scale_colour_gradient(low = "black", high = "red")
#release device
dev.off()

