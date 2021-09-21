#load the data
epc <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_epc <- subset(epc, Date %in% c("1/2/2007","2/2/2007"))
data_epc$Date <- as.Date(data_epc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_epc$Date), data_epc$Time)
data_epc$Datetime <- as.POSIXct(datetime)

## Plot 2
with(data_epc, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()