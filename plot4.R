hpc<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,fill = TRUE)

hpc$Global_active_power <- as.numeric(as.vector(hpc$Global_active_power))
hpc$Sub_metering_1 <- as.numeric(as.vector(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.vector(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.vector(hpc$Sub_metering_3))
hpc$Global_reactive_power <- as.numeric(as.vector(hpc$Global_reactive_power))
hpc$Voltage <- as.numeric(as.vector(hpc$Voltage))

hpc$X.Date <- as.Date(hpc$X.Date,"%d/%m/%Y")

hpcplot2<- hpc[hpc$X.Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")),]

hpcplot2 <- cbind(hpcplot2,DayOfWeek=format(hpcplot2$X.Date, "%a"))

dateTime <- paste(hpcplot2$X.Date, hpcplot2$Time)

#head(dateTime)

hpcplot2 <-cbind(hpcplot2,dateTime=strptime(dateTime, "%Y-%m-%d %H:%M:%S"))

#lapply(hpcplot2, class)

png(filename="plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

plot(hpcplot2$dateTime,hpcplot2$Global_active_power,type = "l",xlab="",ylab="Global Active Power")

plot(hpcplot2$dateTime,hpcplot2$Voltage,type = "l",xlab="datetime",ylab="Voltage")

plot(hpcplot2$dateTime,hpcplot2$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
lines(hpcplot2$dateTime,hpcplot2$Sub_metering_2,type = "l",xlab="",col="RED")
lines(hpcplot2$dateTime,hpcplot2$Sub_metering_3,type = "l",xlab="",col="BLUE")
legend("topright",lwd=2,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")

plot(hpcplot2$dateTime,hpcplot2$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

