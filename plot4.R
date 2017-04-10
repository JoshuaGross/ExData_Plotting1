# Experimentally verified that this is the correct offset in the file to get
# data only for 1/2/2007 and 2/2/2007
df <- read.table("/Users/joshuagross/Downloads/household_power_consumption.txt", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";", na.strings="?", nrows=2880, skip=66637)
df <- within(df, Datetime <- paste(Date, Time, sep=" "))
df <- within(df, Datetime <- sub("(1|2)\\/(1|2)\\/", "0\\1/0\\2/", Datetime)) # add leading zeros
df <- within(df, Datetime <- as.POSIXct(Datetime, format="%d/%m/%Y %H:%M:%S", tz="GMT"))

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA,
    type = c("quartz"))

par(mfrow=c(2,2))

plot(df$Datetime, df$Global_active_power, ylab="Global Active Power", xlab="", type="l")

plot(df$Datetime, df$Voltage, ylab="Voltage", xlab="datetime", type="l")

plot(df$Datetime, df$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
lines(df$Datetime, df$Sub_metering_2, col="red")
lines(df$Datetime, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2,2), col=c("black","red", "blue"))

plot(df$Datetime, df$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()
