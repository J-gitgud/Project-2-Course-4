# Read data and get libraries
path <- getwd()
file.path(path,"exdata_data_NEI_data")
data<-unzip(zipfile = "exdata_data_NEI_data.zip") 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

library(dplyr)
library(ggplot2)

#plot3

type<- subset(NEI, select= type)
baltYrTypEmm <- aggregate(Emissions ~ year+ type, baltimore, sum)
png("plot3.png")
plot<- ggplot(baltYrTypEmm, aes(year, Emissions, color=type))+ geom_line()+ 
  ggtitle("Total Baltimore Emissions" [2.5]* "From 1999 to 2008") + theme(plot.title = element_text(hjust = 0.5))

plot

dev.off()
