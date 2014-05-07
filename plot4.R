# Load data, skipping to the relevant section & loading it by length
hpc <- read.table(file = "household_power_consumption.txt", 
                  sep = ";", 
                  skip = 66637,
                  nrows = 2880,
                  as.is = T)

# Rename variables for readability
names(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# Concatenate date & time, and convert to POSIXct format
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Open graphics device
png(file = "plot4.png")

# Set number of plots
par(mfrow = c(2,2))
    
# plot 1,1
plot.ts(hpc$Global_active_power, ylab = "Global Active Power", xlab = "", xaxt = "n")
# Label x-axis with days of the week
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(1, 1450, 2880))

# plot 1,2
plot.ts(hpc$Voltage, ylab = "Voltage", xlab = "datetime", xaxt = "n")
# Label x-axis with days of the week
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(1, 1450, 2880))

# plot 2, 1
plot.ts(hpc[7:9], plot.type = "single", ylab = "Energy sub metering",  xlab = "", xaxt = "n")
# Color the lines
lines(hpc[8], col = "red")
lines(hpc[9], col = "blue")
# Add a legend
legend("topright", legend = names(hpc[7:9]), lwd = 1, col = c("black", "red", "blue"), bty = "n")
# Label x-axis with days of the week
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(1, 1450, 2880))

# plot 2, 2
# Create a single univariate time-series graph, labeling the y-axis and eliminating x-axis ticks
plot.ts(hpc[4],  ylab = names(hpc[4]), xlab = "datetime", xaxt = "n")
# Label x-axis with days of the week
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(1, 1450, 2880))

# Close GD
dev.off()