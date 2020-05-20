#Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
library(dplyr)
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
#?download.file
download.file(url, destfile="Data_for_peer_assessment.zip")

#unzip
unzip("Data_for_peer_assessment.zip")


#read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

emission_in_Baltimore<-NEI[NEI$fips=="24510",]

#group by source and year
ems_bal_type_year<- emission_in_Baltimore %>%
  group_by(year, type) %>%
  summarise(sum_ems=sum(Emissions))
#plot graph
png("plot3.png", width=480, height=480)
ems_bal_type_year %>%
ggplot(aes(year, sum_ems, group = type, colour=type)) +  geom_line()
dev.off()  
