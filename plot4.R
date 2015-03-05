## The function takes the location of the data file as an argument 
## Returns plot3 as specified in the assignment

plot4 <- function(dataFile) {
  tempData <- read.table(dataFile, header = TRUE, sep = ';', na.strings = '?',
                         stringsAsFactors = FALSE, dec = '.')
  # Isolating data in chosen days
  data <- tempData[tempData$Date %in% c('1/2/2007','2/2/2007'),] 
  # Creating a vector of datetimes
  dates <- paste(data$Date,data$Time)
  dates <- as.POSIXct(dates, format = '%d/%m/%Y %H:%M:%S')
  # Plotting
  png(file='plot4.png')
  par(mfrow=c(2,2))
  plot(dates, data$Global_active_power, type = 'l', xlab = '', 
       ylab = 'Global Active Power')
  plot(dates, data$Voltage, type = 'l', xlab = 'datetime', 
       ylab = 'Voltage')
  plot(dates, data$Sub_metering_1, type = 'l', xlab = '', 
       ylab = 'Energy sub metering')
  lines(dates, data$Sub_metering_2, col = 'red')
  lines(dates, data$Sub_metering_3, col = 'blue')
  legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
         col = c('black', 'red', 'blue'), lty = c(1,1,1), bty = 'n')
  plot(dates, data$Global_reactive_power, type = 'l', xlab = 'datetime', 
       ylab = 'Global_reactive_power')
  dev.off()
}