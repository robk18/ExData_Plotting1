data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-data[data$Global_active_power != '?',]
plot_data<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",]
plot_data$Global_active_power<-as.numeric(plot_data$Global_active_power)
png("plot1.png",width = 480, height=480)
hist(plot_data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()