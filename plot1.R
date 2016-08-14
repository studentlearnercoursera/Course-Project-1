plot1=read.table("household_power_consumption.txt",skip=1,sep=";")
names(plot1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subbedplot1 <- subset(plot1,plot1$Date=="1/2/2007" | plot1$Date =="2/2/2007")

subbedplot1$Date <- as.Date(subbedplot1$Date, format="%d/%m/%Y")
subbedplot1$Time <- strptime(subbedplot1$Time, format="%H:%M:%S")
subbedplot1[1:1440,"Time"] <- format(subbedplot1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subbedplot1[1441:2880,"Time"] <- format(subbedplot1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mar=c(5,5,2,2))
hist(as.numeric(as.character(subbedplot1$Global_active_power)), col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)")
