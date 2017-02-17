#Read data in.
household_data<-read.table("household_power_consumption.txt", sep=';',header=TRUE)

#Subset by date.
data_subset<-household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"),]

#Consolidate date and time.
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Subset for sub_metering
sub1<-data_subset$Sub_metering_1
sub2<-data_subset$Sub_metering_2
sub3<-data_subset$Sub_metering_3


#Create line graph and save as png file. 
png("plot3.png", width=480, height=480)

plot3<-plot(datetime, sub1, type='l', xlab='',ylab='Energy sub metering')

plot3<-lines(datetime,sub2,type='l',col='red')

plot3<-lines(datetime,sub3,type='l',col='blue')

#Create legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.80,lty=1:1,lwd=2, col=c("black", "red", "blue"))


dev.off()