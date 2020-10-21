## Read entire data
pow <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt")

## Extract data collected within the period 1/2/2007 to 2/2/2007
subpow <- pow[pow$Date %in% c("1/2/2007","2/2/2007"), ]

## Format the "Date" and "Time" columns into one
datetime <- strptime(paste(subpow$Date, subpow$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Ensuring that sub metering fields are numeric
submetering1 <- as.numeric(subpow$Sub_metering_1)
submetering2 <- as.numeric(subpow$Sub_metering_2)
submetering3 <- as.numeric(subpow$Sub_metering_3)

## Plotting
png("plot3.png", width = 480, height = 480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()