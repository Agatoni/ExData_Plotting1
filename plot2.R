
# unzips file
unzip("EDA Project 1.zip")


# reads data 
h_power <- data.table::fread("household_power_consumption.txt", sep = ";",
                             na.strings = "?", data.table = FALSE)


# subsets for "01/02/2007" and "02/02/2007"
h_power$Date <- as.Date(h_power$Date, "%d/%m/%Y" )
mydata <- janitor::clean_names(subset(h_power, Date == "2007-02-01"| 
                                        Date == "2007-02-02"))


# creates POSIXct variable from date and time
mydata$datetime <- as.POSIXct(paste(mydata$date, mydata$time))



# plots timeseries of global active power
par(mfrow = c(1,1))
with (mydata, plot(datetime, global_active_power, type = "l",
                   ylab = "Global Active Power (kilowatts)", xlab = ""))


# saves plot to file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
