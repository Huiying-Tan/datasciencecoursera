
data<- read.table( "household_power_consumption.txt", header=TRUE, sep=";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

data$Global_active_power<-as.numeric(data$Global_active_power)

#1000
data_filtered<-filter(data, Date >="2007/02/01" & Date <= "2007/02/02")
data_filtered$Sub_metering_1<-as.numeric(data_filtered$Sub_metering_1)
data_filtered$Sub_metering_2<-as.numeric(data_filtered$Sub_metering_2)
data_filtered$Sub_metering_3<-as.numeric(data_filtered$Sub_metering_3)
data_filtered$datetime <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(data_filtered$datetime,
     data_filtered$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy Sub Metering")
lines(data_filtered$datetime,
      data_filtered$Sub_metering_2, type="l",col="red")
lines(data_filtered$datetime,
      data_filtered$Sub_metering_3, type="l", col="blue")


legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5, 
       col=c("black","red","blue"))



dev.off()

