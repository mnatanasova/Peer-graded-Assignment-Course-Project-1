test <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")
test$Date_Time <- strptime(paste(test$Date, test$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
test$Date <- as.Date(test$Date, format = "%d/%m/%Y")
test$Global_active_power <- as.numeric(test$Global_active_power)
test$Global_reactive_power <- as.numeric(test$Global_reactive_power)
test$Voltage <- as.numeric(test$Voltage)
test$Global_intensity <- as.numeric(test$Global_intensity)
test$Sub_metering_1 <- as.numeric(test$Sub_metering_1)
test$Sub_metering_2 <- as.numeric(test$Sub_metering_2)
test$Sub_metering_3 <- as.numeric(test$Sub_metering_3)

subData <- test[(test$Date == "2007-02-01") | (test$Date == "2007-02-02"), ]


Sys.setlocale(category = "LC_ALL", locale = "english")
png("plot3.png",width = 480, height = 480) 
plot(subData$Date_Time , subData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subData$Date_Time , subData$Sub_metering_2, type = "l", col = "red")
lines(subData$Date_Time , subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),  legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = 2 )
dev.off() 
