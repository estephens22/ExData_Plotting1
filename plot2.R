##Read data
Temp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",na.strings="?",stringsAsFactors = FALSE)
##Filter to 2 days we are interested in
Elec <- subset(Temp, Date =="1/2/2007" | Date=="2/2/2007")
##remove the master copy to free up memory
rm(Temp)
##Combine Date and Time so we can format them together
TempDateTime <- paste(Elec$Date, Elec$Time, sep=" ")
Elec$DateTime <- as.POSIXct(TempDateTime, format="%d/%m/%Y %H:%M:%S")
## Open the png device
png("plot2.png",width=480, height=480)
##Open the plot with no data
plot(Elec$DateTime,Elec$Global_active_power,type="n", xlab="", ylab = "Global Active Power (Kilowatts)")
##Add the line
lines(Elec$DateTime,Elec$Global_active_power,col="black")
##close the png device
dev.off()
