plot4 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(plot4) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subplot4 <- subset(plot4,plot4r$Date=="1/2/2007" | plot4$Date =="2/2/2007")

subplot4$Date <- as.Date(subplot4$Date, format="%d/%m/%Y")
subplot4$Time <- strptime(subplot4$Time, format="%H:%M:%S")
subplot4[1:1440,"Time"] <- format(subplot4[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subplot4[1441:2880,"Time"] <- format(subplot4[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

  par(mfrow=c(2,2))
  
  with(subplot4,{
    plot(subplot4$Time,as.numeric(as.character(subplot4$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
    plot(subplot4$Time,as.numeric(as.character(subplot4$Voltage)), type="l",xlab="datetime",ylab="Voltage")
    plot(subplot4$Time,subplot4$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
     with(subplot4,lines(Time,as.numeric(as.character(Sub_metering_1))))
     with(subplot4,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
     with(subplot4,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
     legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
    plot(subplot4$Time,as.numeric(as.character(subplot4$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
  })
