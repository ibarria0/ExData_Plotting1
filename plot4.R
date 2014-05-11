#read data
h <- read.csv2('household_power_consumption.txt', header=TRUE, colClasses = c(rep("character",9)),comment.char = "?" )
h$datetime <- strptime(paste(h$Date, h$Time), "%d/%m/%Y %H:%M:%S")
df <- subset(h, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))
df[3:9] <- lapply(df[3:9], as.numeric)

#plo4
png('plot4.png', width=640, height=640)
par(mfcol = c(2,2))
with(df, plot(datetime, Global_active_power, pch='-',lty=1,type='l',ylab="Global Active Power (kilowatts)", xlab=""))
with(df, {
	plot(datetime, Sub_metering_1,type='n',ylab="Energy sub metering", xlab="")
	lines(datetime, Sub_metering_1, type="l", col="black")
	lines(datetime, Sub_metering_2, type="l", col="red")
	lines(datetime, Sub_metering_3, type="l", col="blue")
	legend("topright", legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), lty = c(1,1), lwd=c(2.5,2.5), box.lwd = 0, col = c('black','red','blue'))
	}
)	
with(df, plot(datetime, Voltage, pch='-',lty=1,type='l',ylab="Voltage", xlab=""))
with(df, plot(datetime, Global_reactive_power, pch='-',lty=1,type='l',ylab="Global_reactive_power", xlab=""))
dev.off()
