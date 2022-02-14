# Read data and get libraries
path <- getwd()
file.path(path,"exdata_data_NEI_data")
data<-unzip(zipfile = "exdata_data_NEI_data.zip") 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

library(dplyr)
library(ggplot2)

# plot6
#organize data
baltYrTypEmmFips <- summarise(group_by(filter(NEI, NEI$fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
laYrTypEmmFips <- summarise(group_by(filter(NEI, NEI$fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltYrTypEmmFips$County <- "Baltimore City"
laYrTypEmmFips$County <- "Los Angeles County"

baltLaEmissions <- rbind(baltYrTypEmmFips, laYrTypEmmFips)

#make plot
png("plot6.png")
plot3<- ggplot(baltLaEmissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission in tons | Baltimore City vs Los Angeles County"))+
  geom_label(aes(fill = County), colour= "blue")
plot3             
 

dev.off()
          
