# Experimentally verified that this is the correct offset in the file to get
# data only for 1/2/2007 and 2/2/2007
df <- read.table("/Users/joshuagross/Downloads/household_power_consumption.txt", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";", na.strings="?", nrows=2880, skip=66637)
df <- within(df, Datetime <- paste(Date, Time, sep=" "))
df <- within(df, Datetime <- sub("(1|2)\\/(1|2)\\/", "0\\1/0\\2/", Datetime)) # add leading zeros
df <- within(df, Datetime <- as.POSIXct(Datetime, format="%d/%m/%Y %H:%M:%S", tz="GMT"))
#df <- within(df, Datetime <- strftime(Datetime, format="%d/%m/%Y %H:%M:%S"))
#df <- within(df, Datetime <- format(Datetime, "%a %b %d"))
#df <- within(df, Datetime <- as.Date(Datetime))

summary(df)
names(df)

print(df$Datetime)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA,
    type = c("quartz"))

plot(df$Datetime, df$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

dev.off()
