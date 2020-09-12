# Code to produce plot4.png.

# Load data and filter on the desired Date values:
data <- read.csv('data/household_power_consumption.txt',sep=';')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

# Create new datetime column
data$Datetime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%d/%m/%Y %H:%M:%OS")

# Open png device
png(filename = "plot4.png")

par(mfcol = c(2,2))

# Plot first figure (G.A.P)
plot(data$Datetime,
     data$Global_active_power,
     type = 'n',
     xlab = '',
     ylab = 'Global Active Power')
lines(data$Datetime,
      data$Global_active_power)

# Plot second figure (E.S.M)
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
       lty = 1,
       bty = 'n')

# Plot third figure (Voltage)
plot(data$Datetime,
     data$Voltage,
     type = 'n',
     xlab = 'datetime',
     ylab = 'Voltage')
lines(data$Datetime,
      data$Voltage)

# Plot fourth figure (G.R.P)
plot(data$Datetime,
     data$Global_reactive_power,
     type = 'n',
     xlab = 'datetime',
     ylab = 'Global_reactive_power')
lines(data$Datetime,
      data$Global_reactive_power)

# Close png device
dev.off()