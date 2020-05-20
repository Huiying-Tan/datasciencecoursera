#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008?
#Use the base plotting system to make a plot answering this question.

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
emission_by_yr_BAL<-aggregate(Emissions ~ year, emission_in_Baltimore, sum)
png("plot2.png", width=480, height=480)

barplot(  emission_by_yr_BAL$Emissions,
  main="Total emission for each year",
  xlab = "Year",
  ylab = "Emissions in tons",
  names.arg = emission_by_yr_BAL$year
      
)
dev.off()
