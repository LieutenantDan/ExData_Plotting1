## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Define beginning and ending points in data
begin <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

## Subset Data
data <- subset(data, data$Date >= begin)
data <- subset(data, data$Date <= end)

## Convert Date to Date-Time Object
data$Date <- as.character(data$Date)
data$Date <- suppressWarnings(as.POSIXct(paste(data$Date,data$Time), "%Y/%m/%d %H:%M:%S"))

## Convert rest of necessary data to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

## Multi plot
par(mfrow = c(2,2))
with(data, {
    suppressWarnings(plot(Date, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l"))
    
    suppressWarnings(plot(Date, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))
    
    suppressWarnings(plot(Date, Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", type = "l"))
    suppressWarnings(lines(Date, Sub_metering_2, col = "red"))
    suppressWarnings(lines(Date, Sub_metering_3, col = "blue"))
    suppressWarnings(legend("topright", col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex = 0.7))
    
    suppressWarnings(plot(Date, Global_reactive_power, xlab = "datetime", type = "l"))
})