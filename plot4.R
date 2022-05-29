powerdata <- read.table("power.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(subSetData$Global_active_power)
Voltage <- as.numeric(subSetData$Voltage)
Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)

subSetData$Date <- as.Date(subSetData$Date, format = "%d/%m/%Y")
datetime <- paste(subSetData$Date,subSetData$Time)
subSetData$datetime <- as.POSIXct(datetime)

Sub1 <- as.numeric(subSetData$Sub_metering_1)
Sub2 <- as.numeric(subSetData$Sub_metering_2)
Sub3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(subSetData$datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(subSetData$datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(subSetData$datetime, Sub1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subSetData$datetime, Sub2, type = "l", ylab = "Energy sub metering", xlab = "", col="red")
lines(subSetData$datetime, Sub3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(subSetData$datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()