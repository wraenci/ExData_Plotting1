data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings="?")#read file with header, beware of sep=";" and NA="?"
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")#subset rows of interest
data$Global_active_power <- as.numeric(data$Global_active_power)#coerce to numeric for hist
png(file="plot1.png", height=480, width=480)#open png device and create "plot1.png" in wd
hist(data[,3], col="red", border="black", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")#create histogram
dev.off()#close device