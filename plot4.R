data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data_date<- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP<- as.numeric(data$Global_active_power)
GRP<- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)




png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data_date, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(data_date, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
plot(data_date, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(data_date, subMetering2, type="l", col="red")
lines(data_date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=.01, col=c("black", "red", "blue"), bty="o",text.width = .01,cex=.5)


dev.off()