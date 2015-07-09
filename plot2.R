require(sqldf)
require(dplyr)

setwd("~/GitHub/ExData_Plotting1/data")

data <- tbl_df(read.csv.sql("household_power_consumption.txt", 
                       sql="select * from file where Date = '2/2/2007' or Date = '1/2/2007'", 
                       header=TRUE, 
                       sep=";"))
closeAllConnections()

png("../plot2.png", width=480, height=480)

plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), 
     as.numeric(data$Global_active_power), 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()