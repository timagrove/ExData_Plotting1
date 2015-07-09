require(sqldf)
require(dplyr)

setwd("~/GitHub/ExData_Plotting1/data")

data <- tbl_df(read.csv.sql("household_power_consumption.txt", 
                            sql="select * from file where Date = '2/2/2007' or Date = '1/2/2007'", 
                            header=TRUE, 
                            sep=";"))
closeAllConnections()

png("../plot3.png", width=480, height=480)

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
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue"))

dev.off()
