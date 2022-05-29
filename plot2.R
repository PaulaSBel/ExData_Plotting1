powerdata <- read.table("power.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(subSetData$Global_active_power)

subSetData$Date <- as.Date(subSetData$Date, format = "%d/%m/%Y")

datetime <- paste(subSetData$Date,subSetData$Time)
subSetData$datetime <- as.POSIXct(datetime)

plot(subSetData$datetime, subSetData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file="plot2.png", height = 480, width = 480)
dev.off()
