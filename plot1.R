## The function takes the location of the data file as an argument 
## Returns plot1 as specified in the assignment

plot1 <- function(dataFile) {
  tempData <- read.table(dataFile, header = TRUE, sep = ';', na.strings = '?',
                         stringsAsFactors = FALSE, dec = '.')
  # Isolating data in chosen days
  data <- tempData[tempData$Date %in% c('1/2/2007','2/2/2007'),]
  # Plotting
  png(file='plot1.png')
  hist(data$Global_active_power, main = 'Global Active Power', col = 'red',
       xlab = 'Global Active Power (kilowatts)')
  dev.off()
}
