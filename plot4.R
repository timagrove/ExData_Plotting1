require(sqldf)
require(dplyr)

setwd("~/GitHub/ExData_Plotting1/data")

data <- tbl_df(read.csv.sql("household_power_consumption.txt", 
                            sql="select * from file where Date = '2/2/2007' or Date = '1/2/2007'", 
                            header=TRUE, 
                            sep=";"))
closeAllConnections()

png("../plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
     as.numeric(data$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
     as.numeric(data$Voltage), 
     type="l", 
     xlab="strptime(paste(data$Date, data$Time, sep=\" \"), \"%d/%m/%Y %H:%M:%S\")", 
     ylab="as.numeric(data$Voltage)")

plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
     as.numeric(data$Sub_metering_1), 
     type="l", 
     ylab="Energy Submetering", 
     xlab="")

lines(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
      as.numeric(data$Sub_metering_2), 
      type="l", 
      col="red")

lines(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
      as.numeric(data$Sub_metering_3), 
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, 
       lwd=2.5, 
       col=c("black", "red", "blue"), 
       bty="o")

plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
     as.numeric(data$Global_reactive_power), 
     type="l", 
     xlab="strptime(paste(data$Date, data$Time, sep=\" \"), \"%d/%m/%Y %H:%M:%S\")", 
     ylab="Global_reactive_power")

dev.off()