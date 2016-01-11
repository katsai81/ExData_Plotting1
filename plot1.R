hpc<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,fill = TRUE)

#lapply(hpc, class)

hpc$Global_active_power <- as.numeric(as.vector(hpc$Global_active_power))

hpc$X.Date <- as.Date(hpc$X.Date,"%d/%m/%Y")

hpcplot1<- hpc[hpc$X.Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")),]

png(filename="plot1.png",width = 480, height = 480, units = "px")
par(col="RED")
hist(hpcplot1$Global_active_power, 
    right = FALSE, 
    col="RED",
    main="Global Active Power", 
    xlab="Global Active Power (kilowatts)",
    ylab="Frequency")

dev.off()

