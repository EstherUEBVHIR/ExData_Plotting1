#load the data
epc <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_epc <- subset(epc, Date %in% c("1/2/2007","2/2/2007"))
data_epc$Date <- as.Date(data_epc$Date, format="%d/%m/%Y")

#plot1
plot1 <- function() {
         hist(data_epc$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
         dev.copy(png, file="plot1.png", width=480, height=480)
         dev.off()
}
plot1()