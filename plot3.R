data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Global_active_power != '?',]
plot_data<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",]
plot_data$timestamp<-as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%Y-%m-%d %H:%M:%S")
plot_data$Sub_metering_1<-as.numeric(plot_data$Sub_metering_1)
plot_data$Sub_metering_2<-as.numeric(plot_data$Sub_metering_2)
plot_data$Sub_metering_3<-as.numeric(plot_data$Sub_metering_3)

png("plot3.png",width = 480, height=480)
plot(plot_data$timestamp,plot_data$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(plot_data$timestamp,plot_data$Sub_metering_2, col="red")
lines(plot_data$timestamp,plot_data$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1, 1, 1),bty = "n")
dev.off()