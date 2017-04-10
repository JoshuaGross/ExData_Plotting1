# Experimentally verified that this is the correct offset in the file to get
# data only for 1/2/2007 and 2/2/2007
df  <- read.table("/Users/joshuagross/Downloads/household_power_consumption.txt", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";", na.strings="?", nrows=2880, skip=66637)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA,
    type = c("quartz"))

hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col=c("red"))

dev.off()
