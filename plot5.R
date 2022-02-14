# Read data and get libraries
path <- getwd()
file.path(path,"exdata_data_NEI_data")
data<-unzip(zipfile = "exdata_data_NEI_data.zip") 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

library(dplyr)
library(ggplot2)


#plot 5

onroad<- baltYrTypEmm[9:12,]
png("plot5.png")

plot2 <- ggplot(onroad, aes(year, Emissions)) + geom_bar(stat="identity") +
  xlab("year") +ylab(expression("Total Emissions (10^5 tons)")) +
  ggtitle("Baltimore Motor Vehicle PM Emissions From 1999 to 2008") + theme(plot.title = element_text(hjust = 0.5))

plot2


dev.off()
