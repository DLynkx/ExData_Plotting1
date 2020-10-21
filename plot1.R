## Read entire data

pow <- read.csv2("./exdata_data_household_power_consumption/household_power_consumption.txt")

## Extract data collected within the period 1/2/2007 to 2/2/2007
subpow <- pow[pow$Date %in% c("1/2/2007","2/2/2007"), ]

## Ensuring that date and time fields are correctly formatted
pow$Date <- dmy(pow$Date)

## Ensuring that fields is formatted as numeric
globalactivepower <- as.numeric(subpow$Global_active_power)


## Plotting
png("plot1.png")
hist(globalactivepower, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()