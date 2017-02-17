#Read data in.
household_data<-read.table("household_power_consumption.txt", sep=';',header=TRUE)

#Subset by date.
data_subset<-household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"),]

#Consolidate date and time.
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Subset for global_active_power
gap<-as.numeric(as.character(data_subset$Global_active_power))

#Create line graph and save as png file. 
png("plot2.png", width=480, height=480)

plot2<-plot(datetime, gap, type='l',ylab="Global Active Power (kilowatts)", xlab="")

dev.off()