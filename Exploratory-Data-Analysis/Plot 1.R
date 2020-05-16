#getwd()
#url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#?download.file
#download.file(url, destfile="Electric_Power_Consumption.zip")

#library(zip)
library(dplyr)
library(lubridate)
#unzip("Electric_Power_Consumption.zip")
#?read.table
data<- read.table( "household_power_consumption.txt", header=TRUE, sep=";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power<-as.numeric(data$Global_active_power)
#1000
data_filtered<-filter(data, Date >="2007/02/01" & Date <= "2007/02/02")
data_filtered$Global_active_power<-as.numeric(data_filtered$Global_active_power)
data_filtered$Global_active_power

png("plot1.png", width=480, height=480)
#create histogram
hist(data_filtered$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col= "red"
)
dev.off()

