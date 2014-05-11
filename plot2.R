#read data
h <- read.csv2('household_power_consumption.txt', header=TRUE, colClasses = c(rep("character",9)),comment.char = "?" )
h$datetime <- strptime(paste(h$Date, h$Time), "%d/%m/%Y %H:%M:%S")
df <- subset(h, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))
df[3:9] <- lapply(df[3:9], as.numeric)

#plot2
png('plot2.png', width=640, height=640)
with(df, plot(datetime, Global_active_power, pch='-',lty=1,type='l',ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()

