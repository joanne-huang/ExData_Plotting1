#Read data in.
household_data<-read.table("household_power_consumption.txt", sep=';',header=TRUE)

#Subset by date.
data_subset<-household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"),]

#Consolidate date and time.
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Subset for global_active_power
gap<-as.numeric(as.character(data_subset$Global_active_power))

#Subset for sub_metering
sub1<-data_subset$Sub_metering_1
sub2<-data_subset$Sub_metering_2
sub3<-data_subset$Sub_metering_3

#Subset for voltage.
Voltage<-as.numeric(as.character(data_subset$Voltage))

#Subset for global_reactive_power.
Global_reactive_power<-as.numeric(as.character(data_subset$Global_reactive_power))


#Create box plot and save as png file. 
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

top_left<-plot(datetime, gap, type='l',ylab="Global Active Power (kilowatts)", xlab="")

top_right<-plot(datetime, Voltage, type='l')

bottom_left<-plot(datetime, sub1, type='l', xlab='',ylab='Energy sub metering')

bottom_left<-lines(datetime,sub2,type='l',col='red')

bottom_left<-lines(datetime,sub3,type='l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.80,lty=1:1,lwd=2, col=c("black", "red", "blue"))



bottom_right<-plot(datetime, Global_reactive_power, type='l')

dev.off()