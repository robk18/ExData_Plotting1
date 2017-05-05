data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Global_active_power != '?',]
plot_data<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",]
plot_data$timestamp<-as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%Y-%m-%d %H:%M:%S")
plot_data$Global_active_power<-as.numeric(plot_data$Global_active_power)
png("plot2.png",width = 480, height=480)
plot(plot_data$timestamp, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()