## plot2.R
## Load and subsample data
alldata = read.csv("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ';', stringsAsFactors = FALSE)
taskdata = subset(alldata, alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007")
taskdata$DateTime = strptime(paste(taskdata$Date, taskdata$Time), format = "%d/%m/%Y %H:%M:%S")

## Create PNG device, and plot the graphic on it
png(filename = "plot2.png")
plot(taskdata$DateTime, taskdata[,3], type='l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()