## plot3.R
## Load and subsample data
alldata = read.csv("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ';', stringsAsFactors = FALSE)
taskdata = subset(alldata, alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007")
taskdata$DateTime = strptime(paste(taskdata$Date, taskdata$Time), format = "%d/%m/%Y %H:%M:%S")

## Create PNG device, and plot the graphic on it
png(filename = "plot3.png")
plot(taskdata$DateTime, taskdata$Sub_metering_1, type='n', xlab = "", ylab = "Energy sub metering")
lines(taskdata$DateTime, taskdata$Sub_metering_1, col = "black") 
lines(taskdata$DateTime, taskdata$Sub_metering_2, col = "red") 
lines(taskdata$DateTime, taskdata$Sub_metering_3, col = "blue")
legend("topright", legend = names(taskdata[,7:9]), col = c("black", "red", "blue"), lty = 1)
dev.off()