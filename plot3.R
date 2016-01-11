hpc<-read.table("household_power_consumption.txt",sep = ";",header = TRUE ,fill = TRUE)
hpc$X.Date <- as.Date(hpc$X.Date,"%d/%m/%Y")

#lapply(hpc, class)

hpcplot2<- hpc[hpc$X.Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")),]

hpcplot2$Global_active_power <- as.numeric(as.vector(hpcplot2$Global_active_power))
hpcplot2$Sub_metering_1 <- as.numeric(as.vector(hpcplot2$Sub_metering_1))
hpcplot2$Sub_metering_2 <- as.numeric(as.vector(hpcplot2$Sub_metering_2))
hpcplot2$Sub_metering_3 <- as.numeric(as.vector(hpcplot2$Sub_metering_3))

#hpcplot2<- hpcplot2[hpcplot2$Sub_metering_2!=14,] 

hpcplot2 <- cbind(hpcplot2,DayOfWeek=format(hpcplot2$X.Date, "%a"))

dateTime <- paste(hpcplot2$X.Date, hpcplot2$Time)

#head(dateTime)

hpcplot2 <-cbind(hpcplot2,dateTime=strptime(dateTime, "%Y-%m-%d %H:%M:%S"))

lapply(hpcplot2, class)

png(filename="plot3.png",width = 480, height = 480, units = "px")

plot(hpcplot2$dateTime,hpcplot2$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering") 
lines(hpcplot2$dateTime,hpcplot2$Sub_metering_2,type = "l",xlab="",col="RED")
lines(hpcplot2$dateTime,hpcplot2$Sub_metering_3,type = "l",xlab="",col="BLUE")

legend("topright",lwd=2,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
