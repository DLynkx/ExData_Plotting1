## Read entire data
pow <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt")

## Extract data collected within the period 1/2/2007 to 2/2/2007
subpow <- pow[pow$Date %in% c("1/2/2007","2/2/2007"), ]

## Format the "Date" and "Time" columns into one
datetime <- strptime(paste(subpow$Date, subpow$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Ensuring that fields are formatted as numeric
globalactivepower <- as.numeric(subpow$Global_active_power)
globalreactivepower <- as.numeric(subpow$Global_reactive_power)
voltage <- as.numeric(subpow$Voltage)

## Ensuring that sub metering fields are numeric
submetering1 <- as.numeric(subpow$Sub_metering_1)
submetering2 <- as.numeric(subpow$Sub_metering_2)
submetering3 <- as.numeric(subpow$Sub_metering_3)


## Plotting
png("plot4.png", width = 480, height = 480)

## Grid the output sheet
par(mfrow = c(2, 2)) 

## Quadrant1
plot(datetime, globalactivepower, type="l", xlab = " ", ylab="Global Active Power") #, cex=0.2)

## Quadrant2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Quadrant3
plot(datetime, submetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Quadrant4
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global reactive power")
dev.off()