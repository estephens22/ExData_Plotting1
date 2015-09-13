##Read data
Temp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",na.strings="?",stringsAsFactors = FALSE)
##Filter to 2 days we are interested in
Elec <- subset(Temp, Date =="1/2/2007" | Date=="2/2/2007")
##remove master date to free up memory
rm(Temp)
##create the png device
png("plot1.png",width=480, height=480)
##create the plot
hist(Elec$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
##close the device
dev.off()
