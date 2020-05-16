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

data_filtered$datetime <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

png("plot2.png", width=480, height=480)
#create line chart
plot(data_filtered$datetime,
     data_filtered$Global_active_power,
     type="l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()


