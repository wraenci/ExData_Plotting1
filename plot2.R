data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings="?")#read file with header, beware of sep=";" and NA="?"
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")#subset rows of interest
#in case your system language is not English:
user_language <- Sys.getlocale("LC_TIME")#store user language settings
Sys.setlocale("LC_TIME", "English")#set settings to "English"
#make new column "DateTime" for time series plot by adding "Date" and "Time" columns
#and convert it to "POSIXlt" "POSIXt"
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot2.png", height=480, width=480)#open png device and create "plot2.png" in wd
plot(data$DateTime, data$Global_active_power, xlab="", #create empty plot
     ylab="Global Active Power (kilowatts)", type="n")   #with all axes and labels
lines(data$DateTime, data$Global_active_power)         #add line
dev.off()#close device
Sys.setlocale("LC_TIME", user_language)#reset to user language