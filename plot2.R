## Read entire data
pow <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt")

## Extract data collected within the period 1/2/2007 to 2/2/2007
subpow <- pow[pow$Date %in% c("1/2/2007","2/2/2007"), ]

## Format the "Date" and "Time" columns into one
datetime <- strptime(paste(subpow$Date, subpow$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Plotting 
png("plot2.png")
plot(datetime, subpow$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.off()