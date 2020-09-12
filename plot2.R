# Code to produce plot2.png.

# Load data and filter on the desired Date values:
data <- read.csv('data/household_power_consumption.txt',sep=';')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create new datetime column
data$Datetime <- as.POSIXct(paste(data$Date, data$Time),
                            format = "%d/%m/%Y %H:%M:%OS")

# Open png device
png(filename = "plot2.png")

# Plot figure
plot(data$Datetime,
     data$Global_active_power,
     type = 'n',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')
lines(data$Datetime,
      data$Global_active_power)

# Close png device
dev.off()