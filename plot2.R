# Load data, skipping to the relevant section & loading it by length
hpc <- read.table(file = "household_power_consumption.txt", 
                  sep = ";", 
                  skip = 66637,
                  nrows = 2880,
                  as.is = T)

# Rename variables for readability
names(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# Concatenate date & time, and convert to POSIXct format
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S", tz = "EST")

# Convert date to 
# Open graphics device
png(file = "plot2.png")
# Create time-series graph, customizing y-axis titles, eliminating x-axis ticks
plot.ts(hpc$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
# Label with days of the week
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(1, 1450, 2880))
# Close GD
dev.off()