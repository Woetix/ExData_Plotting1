## retrieving the data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", stringsAsFactors=FALSE, comment.char="", quote='\"')

## subsetting the data
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")

## convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime<-strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power ",xlab="")
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy submetering",xlab="",col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_Reactive_power")
## Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()