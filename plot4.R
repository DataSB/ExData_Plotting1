# Plotting multiple plots of time series of global active power, voltage,
#           submetering and global reactive power

## Read data
data <- read.table('./household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

## Convert dates 
data$DateTime <- strptime(paste(data$Date, data$Time), 
                          "%d/%m/%y %H:%M:%S")

## Subset data to 2007-02-01 and 2007-02-02
data <- subset(data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                       as.Date(DateTime) <= as.Date("2007-02-02"))

# Open PNG file - plot4.png
png("plot4.png", height=480, width=480)

# Configure multiple plots
par(mfrow=c(2,2))

# Global Active Power plot
plot(data$DateTime, data$Global_active_power, pch=NA, 
     xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Voltage plot
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data$DateTime, data$Voltage)

# Sub-metering plot
plot(data$DateTime, data$Sub_metering_1, pch=NA, 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Global reactive power plot
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

# Close PNG file
dev.off()