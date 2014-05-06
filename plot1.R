## plot1.R
## Load and subsample data
alldata = read.csv("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ';', stringsAsFactors = FALSE)
taskdata = subset(alldata, alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007")
taskdata$Date = as.Date(taskdata$Date, format = "%d/%m/%Y")

## Create PNG device, and plot the histogram on it
png(filename = "plot1.png")
hist(taskdata[,3], xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()