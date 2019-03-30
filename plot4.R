#Opening png file 
png("plot4.png", width = 480, height = 480)

#Loading dataset into variable data
data <- data.table::fread(file = "household_power_consumption.txt", na.strings = "?", header = TRUE)

#Parsing Date column as 'Date' object, time column as Time 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
time <- strptime(data$Time, format = "%H:%M:%S")

#Subsetting data
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]
x <- (strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))

#Creating the plot
par(mfrow = c(2, 2))
par(mar = c(4, 4, 2, 4))
plot(x, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(x, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x, data$Sub_metering_2, col = "red")
lines(x, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), cex = 0.25)
plot(x, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Closing connection
dev.off()