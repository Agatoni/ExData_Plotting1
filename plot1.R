
# unzips file
unzip("EDA Project 1.zip")


# reads data 
h_power <- data.table::fread("household_power_consumption.txt", sep = ";",
                            na.strings = "?", data.table = FALSE)


# subsets for "01/02/2007" and "02/02/2007"
h_power$Date <- as.Date(h_power$Date, "%d/%m/%Y" )
mydata <- janitor::clean_names(subset(h_power, Date == "2007-02-01"| 
                    Date == "2007-02-02"))

# plots histogram of global active power  
par(mfrow = c(1,1))
hist(mydata$global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power")


# saves plot to file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()






     

  
  
