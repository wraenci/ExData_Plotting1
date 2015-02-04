data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings="?")#read file with header, beware of sep=";" and NA="?"
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")#subset rows of interest
#in case your system language is not English:
user_language <- Sys.getlocale("LC_TIME")#store user language settings
Sys.setlocale("LC_TIME", "English")#set settings to "English"
#make new column "DateTime" for time series plot by adding "Date" and "Time" columns
#and convert it to "POSIXlt" "POSIXt"
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot3.png", height=480, width=480)#open png device and create "plot3.png" in wd
plot(data$DateTime, data$Sub_metering_1, xlab="",   #creat empty plot
     ylab="Energy sub metering", type="n")          #with all axes and labels
lines(data$DateTime, data$Sub_metering_1)              #add line 1
lines(data$DateTime, data$Sub_metering_2, col="red")   #add line 2, set correct colour
lines(data$DateTime, data$Sub_metering_3, col="blue")  #add line 3, set correct colour
#add legend
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=colnames(data)[7:9])
dev.off()#close device
Sys.setlocale("LC_TIME", user_language)#reset to user language