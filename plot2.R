# Read data and get libraries
path <- getwd()
file.path(path,"exdata_data_NEI_data")
data<-unzip(zipfile = "exdata_data_NEI_data.zip") 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

library(dplyr)
library(ggplot2)

#plot2

baltimore <- NEI[NEI$fips=="24510", ]
baltYrEmm <- aggregate(Emissions ~ year, baltimore, sum)
png("plot2.png")
barplot(height=baltYrEmm$Emissions/1000, names.arg=baltYrEmm$year,
        xlab="Year", ylab=expression('Aggregated Emission'),
        main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'), col = pal(1))

dev.off()
