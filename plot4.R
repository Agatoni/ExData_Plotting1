
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


# plots time against global active power, voltage, energy sub metering and 
# global reactive power

par(mfrow = c(2,2), mar = c(4,4,2,2))
with (mydata, {
  
  plot(datetime, global_active_power, type = "l",
                     ylab = "Global Active Power (kilowatts)", xlab = "")
  
  plot(datetime, voltage, type = "l",ylab = "Voltage")
  
  plot(datetime, sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  lines(datetime, sub_metering_2, col = "red")
  lines(datetime, sub_metering_3, col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"), lty = 1, lwd = 1.5)
  
  plot(datetime, global_reactive_power, type = "l")
 
})
par(mfrow = c(1,1))

# saves plot to file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()


