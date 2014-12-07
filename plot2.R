plot2 <- function() {  
  if(!require(sqldf)) {
    install.packages('sqldf');
    library(sqldf);
  }
  
  file <- "household_power_consumption.txt";
  output <- "plot2.png";
  data <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";");
  dates <- paste(as.character(data$Date), data$Time);
  dt <- strptime(dates, format="%d/%m/%Y %H:%M:%S");
  
  gap <- as.numeric(lapply(data$Global_active_power, function(n) as.character(n)));
  png(output);
  plot(dt, gap, type = "l", xlab="", ylab='Global Active Power (kilowatts)');
  dev.off();
  paste("Saved to", output)
}