## retrieving the data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?", stringsAsFactors=FALSE, comment.char="", quote='\"')

## subsetting the data
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")

## convert dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime<-strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$DateTime,data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()