# Code to produce plot3.png.

# Load data and filter on the desired Date values:
data <- read.csv('data/household_power_consumption.txt',sep=';')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create new datetime column
data$Datetime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%d/%m/%Y %H:%M:%OS")

# Open png device
png(filename = "plot3.png")

# Plot figure
plot(data$Datetime,
     data$Sub_metering_1,
     type = 'n',
     xlab = '',
     ylab = 'Energy sub metering')

# Add lines for each sub metering variable:
lines(data$Datetime,
      data$Sub_metering_1)
lines(data$Datetime,
      data$Sub_metering_2,
      col = 'red')
lines(data$Datetime,
      data$Sub_metering_3,
      col='blue')

# Add a legend:
legend('topright',
       legend = c('Sub_metering_1',
                  'Sub_metering_2',
                  'Sub_metering_3'),
       col = c('black','red','blue'),
       lty = 1)

# Close png device
dev.off()