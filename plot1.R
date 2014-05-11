#read data
h <- read.csv2('household_power_consumption.txt', header=TRUE, colClasses = c(rep("character",9)),comment.char = "?" )
h$datetime <- strptime(paste(h$Date, h$Time), "%d/%m/%Y %H:%M:%S")
df <- subset(h, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))
df[3:9] <- lapply(df[3:9], as.numeric)


#plot1
png('plot1.png', width=640, height=640)
with(df, hist(Global_active_power, col='red', main = "Global Active Power", xlab= "Global Active Power (kilowatts)"))
dev.off()
