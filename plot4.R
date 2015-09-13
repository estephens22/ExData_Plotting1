Temp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",na.strings="?",stringsAsFactors = FALSE)
Elec <- subset(Temp, Date =="1/2/2007" | Date=="2/2/2007")
rm(Temp)
##Combine Date and Time so we can format them together
TempDateTime <- paste(Elec$Date, Elec$Time, sep=" ")
Elec$DateTime <- as.POSIXct(TempDateTime, format="%d/%m/%Y %H:%M:%S")
## Open the png device
png("plot4.png",width=480, height=480)

par(mfrow=c(2,2))
## Plot 1 Global active power by day
plot(Elec$DateTime, Elec$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(Elec$DateTime, Elec$Global_active_power, col="black")

##plot 2 Voltage by day
plot(Elec$DateTime, Elec$Voltage, type="n", xlab = "datetime", ylab="Voltage")
lines(Elec$DateTime, Elec$Voltage, col="black")

##plot 3 Energy Submetering
plot(Elec$DateTime,Elec$Sub_metering_1,type="n", xlab="", ylab = "Energy sub metering")
lines(Elec$DateTime,Elec$Sub_metering_1,col="black")
lines(Elec$DateTime,Elec$Sub_metering_2,col="red")
lines(Elec$DateTime,Elec$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

##plot 4 - global reactive power date time
plot(Elec$DateTime, Elec$Global_reactive_power,type = "n", xlab="datetime",ylab="Global_reactive_power")
lines(Elec$DateTime,Elec$Global_reactive_power, col="black")

##close the png device
dev.off()
