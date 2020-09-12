# Code to produce plot1.png.

# Load data and filter on the desired Date values:
data <- read.csv('data/household_power_consumption.txt',sep=';')
data <- data[data$Date %in% c('1/2/2007','2/2/2007'),]
data$Global_active_power <- as.numeric(data$Global_active_power)

# Open png device
png(filename = "plot1.png")

# Plot figure
hist(data$Global_active_power, 
     col='red',
     main = 'Global Active Power',
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

# Close png device
dev.off()