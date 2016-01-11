hpc<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,fill = TRUE)

hpc$Global_active_power <- as.numeric(as.vector(hpc$Global_active_power))

hpc$X.Date <- as.Date(hpc$X.Date,"%d/%m/%Y")

hpcplot2<- hpc[hpc$X.Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")),]

hpcplot2 <- cbind(hpcplot2,DayOfWeek=format(hpcplot2$X.Date, "%a"))

dateTime <- paste(hpcplot2$X.Date, hpcplot2$Time)

#head(dateTime)

hpcplot2 <-cbind(hpcplot2,dateTime=strptime(dateTime, "%Y-%m-%d %H:%M:%S"))

lapply(hpcplot2, class)

png(filename="plot2.png",width = 480, height = 480, units = "px")

plot(hpcplot2$dateTime,hpcplot2$Global_active_power,type = "l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()