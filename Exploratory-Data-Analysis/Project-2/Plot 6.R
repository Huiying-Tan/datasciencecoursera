#Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.
library(ggplot2)
library(dplyr)


#read files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

emission_in_Baltimore<-NEI[NEI$fips=="24510",]
emission_in_LA<-NEI[NEI$fips=="06037",]

#group by year Baltimore
ems_bal_year<- emission_in_Baltimore %>%
  group_by(year) %>%
  summarise(sum_ems=sum(Emissions))

#group by year LA
ems_LA_year<- emission_in_LA %>%
  group_by(year) %>%
  summarise(sum_ems=sum(Emissions))

ems_LA_year$City<-"LA"
ems_bal_year$City<-"Baltimore"

ems_combined<-rbind(ems_bal_year,ems_LA_year)

#plot graph
png("plot6.png", width=480, height=480)
ems_combined %>%
  ggplot(aes(year, sum_ems, group = City, colour=City)) +  geom_line()
dev.off()  
