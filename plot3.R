## retrieving the data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", stringsAsFactors=FALSE, comment.char="", quote='\"')

## subsetting the data
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")

## convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime<-strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="",col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()