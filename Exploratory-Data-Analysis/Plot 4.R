
data<- read.table( "household_power_consumption.txt", header=TRUE, sep=";")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

data$Global_active_power<-as.numeric(data$Global_active_power)

#filter date
data_filtered<-filter(data, Date >="2007/02/01" & Date <= "2007/02/02")
#global active power
data_filtered$Global_active_power<-as.numeric(data_filtered$Global_active_power)
#sub metering
data_filtered$Sub_metering_1<-as.numeric(data_filtered$Sub_metering_1)
data_filtered$Sub_metering_2<-as.numeric(data_filtered$Sub_metering_2)
data_filtered$Sub_metering_3<-as.numeric(data_filtered$Sub_metering_3)
data_filtered$datetime <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
#voltage
data_filtered$Voltage<-as.numeric(data_filtered$Voltage)
#global reactive power
data_filtered$Global_reactive_power<-as.numeric(data_filtered$Global_reactive_power)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data_filtered$datetime,
     data_filtered$Global_active_power,
     type="l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(data_filtered$datetime,
     data_filtered$Voltage,
     type="l",
     xlab="datetime", 
     ylab="Voltage")

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

plot(data_filtered$datetime,
     data_filtered$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
     
     )

dev.off()



