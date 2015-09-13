Temp <- read.table("household_power_consumption.txt",header=TRUE,sep=";",quote="",na.strings="?",stringsAsFactors = FALSE)
Elec <- subset(Temp, Date =="1/2/2007" | Date=="2/2/2007")
rm(Temp)
##Combine Date and Time so we can format them together
TempDateTime <- paste(Elec$Date, Elec$Time, sep=" ")
Elec$DateTime <- as.POSIXct(TempDateTime, format="%d/%m/%Y %H:%M:%S")
## Open the png device
png("plot3.png",width=480, height=480)
##Creat the plot
plot(Elec$DateTime,Elec$Sub_metering_1,type="n", xlab="", ylab = "Energy sub metering")
lines(Elec$DateTime,Elec$Sub_metering_1,col="black")
lines(Elec$DateTime,Elec$Sub_metering_2,col="red")
lines(Elec$DateTime,Elec$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##close the png device
dev.off()
