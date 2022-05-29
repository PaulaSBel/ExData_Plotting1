powerdata <- read.table("power.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors = FALSE, dec=".")
subSetData <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007") ,]

Global_active_power <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(Global_active_power, col="Red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()