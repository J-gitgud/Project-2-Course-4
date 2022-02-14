# Read data and get libraries
path <- getwd()
file.path(path,"exdata_data_NEI_data")
data<-unzip(zipfile = "exdata_data_NEI_data.zip") 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  

library(dplyr)
library(ggplot2)

#plot4

combustionRelated <- grep("comb", SCC[, SCC.Level.One], ignore.case=TRUE)
coalRelated <- grep("coal", SCC[, SCC.Level.Four], ignore.case=TRUE) 
combustionSCC <- SCC[combustionRelated & coalRelated, SCC]
combustionNEI <- NEI[NEI[,SCC] %in% combustionSCC]

png("plot4.png")
plot1<- ggplot(combustionNEI, aes(factor(year), Emissions))
plot1 <- plot + geom_bar(stats="identity") +
  xlab("year") +  
  ylab(expression('Total Emissions')) +
  ggtitle('Total Coal Emissions From 1999 to 2008 for combustion')

plot1

dev.off()
