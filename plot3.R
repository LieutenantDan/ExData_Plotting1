## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
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

## Convert Submeter data to numeric
data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Plot Graph
plot(data$Date, data$Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$Date, data$Sub_metering_2, col = "red")
lines(data$Date, data$Sub_metering_3, col = "blue")
legend("topright", col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

