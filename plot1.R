#Read data in.
household_data<-read.table("household_power_consumption.txt", sep=';',header=TRUE)

#Subset by date.
data_subset<-household_data[household_data$Date %in% c("1/2/2007", "2/2/2007"),]

#Subset for global_active_power
gap<-as.numeric(as.character(data_subset$Global_active_power))

#Create histogram and save as png file. 
png("plot1.png", width=480, height=480)

plot1<-hist(as.numeric(gap), xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power", col="red")

dev.off()