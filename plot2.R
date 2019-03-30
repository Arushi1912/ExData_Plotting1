#Opening png file 
png("plot2.png", width = 480, height = 480)

#Create plot

#Loading dataset into variable data
data <- data.table::fread(file = "household_power_consumption.txt", na.strings = "?", header = TRUE)

#Parsing Date column as 'Date' object, time column as Time 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
time <- strptime(data$Time, format = "%H:%M:%S")

#Subsetting data
data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

x <- (strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))
plot(x, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Close connection
dev.off()
