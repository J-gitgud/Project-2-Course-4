# Read data and get libraries
path <- getwd()
file.path(path,"exdata_data_NEI_data")
data<-unzip(zipfile = "exdata_data_NEI_data.zip") 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

library(dplyr)
library(ggplot2)

#Plot1

workdata<- aggregate(Emissions ~ year, NEI_data, sum)
pal<- colorRampPalette(c("goldenrod"))
png("plot1.png")
barplot(height = workdata$Emissions/1000,names.arg=workdata$year,
        xlab="Year", ylab=expression('Aggregated Emission'),
        main=expression('Aggregated PM'[2.5]*' Emmissions by Year'), col = pal(1))


dev.off()
