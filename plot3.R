plot3 <- function() {  
  if(!require(sqldf)) {
    install.packages('sqldf');
    library(sqldf);
  }
  
  file <- "household_power_consumption.txt";
  output <- "plot3.png";
  data <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";");
  dates <- paste(as.character(data$Date), data$Time);
  dt <- strptime(dates, format="%d/%m/%Y %H:%M:%S");
  
  png(output);
  plot(dt, data$Sub_metering_1, type = "l", xlab="", ylab='Global Active Power (kilowatts)', col="black");
  lines(dt, data$Sub_metering_2, type = "l", xlab="", ylab='Global Active Power (kilowatts)', col="red");
  lines(dt, data$Sub_metering_3, type = "l", xlab="", ylab='Global Active Power (kilowatts)', col="blue");
  legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  dev.off();
  paste("Saved to", output)
}