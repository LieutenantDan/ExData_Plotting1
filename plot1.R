## Read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Define beginning and ending points in data
begin <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

## Subset Data
data <- subset(data, data$Date >= begin)
data <- subset(data, data$Date <= end)

## Convert to Global Active Power to numeric data
data$data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## Plot Histogram
hist(data$data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")