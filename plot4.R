data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings="?")#read file with header, beware of sep=";" and NA="?"
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")#subset rows of interest
#in case your system language is not English:
user_language <- Sys.getlocale("LC_TIME")#store user language settings
Sys.setlocale("LC_TIME", "English")#set settings to "English"
#make new column "DateTime" for time series plot by adding "Date" and "Time" columns
#and convert it to "POSIXlt" "POSIXt"
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot4.png", height=480, width=480)#open png device and create "plot4.png" in wd
par(mfcol=c(2,2))#divide plot into 2 columns and 2 rows - columns fill up first
plot(data$DateTime, data$Global_active_power, xlab="", #create empty plot1
     ylab="Global Active Power", type="n")             #with all axes and labels
lines(data$DateTime, data$Global_active_power)         #add line
plot(data$DateTime, data$Sub_metering_1, xlab="",      #create empty plot2
     ylab="Energy sub metering", type="n")             #with all axes and labels
lines(data$DateTime, data$Sub_metering_1)              #add line 1
lines(data$DateTime, data$Sub_metering_2, col="red")   #add line 2, set correct colour
lines(data$DateTime, data$Sub_metering_3, col="blue")  #add line 3, set correct colour
#add legend without border
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=colnames(data)[7:9], 
       bty="n")
plot(data$DateTime, data$Voltage, xlab="datetime",     #create empty plot3
     ylab="Voltage", type="n")                         #with all axes and labels
lines(data$DateTime, data$Voltage)                     #add line
plot(data$DateTime, data$Global_reactive_power,        #create empty plot4
     xlab="datetime", ylab="Global_reactive_power", type="n")#with all axes and labels
lines(data$DateTime, data$Global_reactive_power)       #add line
dev.off()#close device
Sys.setlocale("LC_TIME", user_language)#reset to user language