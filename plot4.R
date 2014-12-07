plot4 <- function() {  
  if(!require(sqldf)) {
    install.packages('sqldf');
    library(sqldf);
  }
  
  file <- "household_power_consumption.txt";
  output <- "plot4.png";
  data <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";");
  dates <- paste(as.character(data$Date), data$Time);
  dt <- strptime(dates, format="%d/%m/%Y %H:%M:%S");
  
  gap <- as.numeric(lapply(data$Global_active_power, function(n) as.character(n)));
  png(output);
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  with(data, {
  plot(dt, Global_active_power, type = "l", xlab="", ylab='Global Active Power (kilowatts)');
  plot(dt, Voltage, type = "l", xlab="");
  plot(dt, data$Sub_metering_1, type = "l", xlab="", ylab='Global Active Power (kilowatts)', col="black");
  lines(dt, data$Sub_metering_2, type = "l", xlab="", ylab='Global Active Power (kilowatts)', col="red");
  lines(dt, data$Sub_metering_3, type = "l", xlab="", ylab='Global Active Power (kilowatts)', col="blue");
  legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  plot(dt, Global_reactive_power, type = "l", xlab="", ylab='Global Rective Power (kilowatts)');
  });
  dev.off();
  paste("Saved to", output)
}