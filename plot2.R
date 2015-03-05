## The function takes the location of the data file as an argument 
## Returns plot2 as specified in the assignment

plot2 <- function(dataFile) {
  tempData <- read.table(dataFile, header = TRUE, sep = ';', na.strings = '?',
                         stringsAsFactors = FALSE, dec = '.')
  # Isolating data in chosen days
  data <- tempData[tempData$Date %in% c('1/2/2007','2/2/2007'),] 
  # Creating a vector of datetimes
  dates <- paste(data$Date,data$Time)
  dates <- as.POSIXct(dates, format = '%d/%m/%Y %H:%M:%S')
  # Plotting
  png(file='plot2.png')
  plot(dates, data$Global_active_power, type = 'l', xlab = '', 
       ylab = 'Global Active Power (kilowatts)')
  dev.off()
}
