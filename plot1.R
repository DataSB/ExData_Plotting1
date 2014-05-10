## Plotting Histogram of Global Active Power

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

## Open PNG file - plot1.png
png("plot1.png", height=480, width=480)

## Create histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

## Close PNG file
dev.off()