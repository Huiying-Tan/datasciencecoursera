#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008?

getwd()
setwd("C:/Users/Hui Ying/Documents/datasciencecoursera/Exploratory-Data-Analysis/Project-2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#join NEI and SCC
library(dplyr)
library(readtext)
#filter for coal
head(SCC)
levels(SCC$EI.Sector)

filtered_SCC<-SCC[ grepl( "vehicles|Vehicles" , ( SCC$EI.Sector) ), ]

#filtering NEI for coal
filtered_NEI<- NEI %>%
  inner_join(filtered_SCC, by = "SCC")

names(filtered_NEI)

#sum emission by yr
filtered_NEI_yr<-aggregate(Emissions ~ year, filtered_NEI, sum)

head(filtered_NEI_yr)

#plot chart
png("plot5.png", width=480, height=480)
barplot(filtered_NEI_yr$Emission,
        main="Emissions from motor vehicle sources",
        xlab = "Year",
        ylab = "Emissions in tons",
        names.arg = filtered_NEI_yr$year
        
)
dev.off()
