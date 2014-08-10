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

## Convert to Global Active Power to numeric data
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)

## Plot w/o t/z warnings
suppressWarnings(plot(data$Date, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

data$Date <- as.character(data$Date)
data$Date <- as.POSIXct(paste(data$Date,data$Time), "%Y/%m/%d %H:%M:%S")