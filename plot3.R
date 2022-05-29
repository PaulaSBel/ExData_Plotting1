powerdata <- read.table("power.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

Sub1 <- as.numeric(subSetData$Sub_metering_1)
Sub2 <- as.numeric(subSetData$Sub_metering_2)
Sub3 <- as.numeric(subSetData$Sub_metering_3)

subSetData$Date <- as.Date(subSetData$Date, format = "%d/%m/%Y")

datetime <- paste(subSetData$Date,subSetData$Time)
subSetData$datetime <- as.POSIXct(datetime)

plot(subSetData$datetime, Sub1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(subSetData$datetime, Sub2, type = "l", ylab = "Energy sub metering", xlab = "", col="red")
lines(subSetData$datetime, Sub3, type = "l", ylab = "Energy sub metering", xlab = "", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()