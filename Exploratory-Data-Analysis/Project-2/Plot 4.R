#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008?


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#join NEI and SCC
library(dplyr)
library(readtext)
#filter for coal
filtered_SCC<-SCC[ grepl( "Coal|coal" , ( SCC$EI.Sector) ), ]

#filtering NEI for coal
filtered_NEI<- NEI %>%
  inner_join(filtered_SCC, by = "SCC")



#sum emission by yr
filtered_NEI_yr<-aggregate(Emissions ~ year, filtered_NEI, sum)


#plot chart
png("plot4.png", width=480, height=480)
barplot(filtered_NEI_yr$Emission,
        main="Emissions from coal combustion-related sources",
        xlab = "Year",
        ylab = "Emissions in tons",
        names.arg = filtered_NEI_yr$year
        
)
dev.off()
