plot1 <- function() {  
  if(!require(sqldf)) {
    install.packages('sqldf');
    library(sqldf);
  }
  
  file <- "household_power_consumption.txt";
  output <- "plot1.png";
  data <- read.csv.sql(file, sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep = ";");
  
  gap <- as.numeric(lapply(data$Global_active_power, function(n) as.character(n)));
  png(output);
  hist(gap, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'red');
  dev.off();
  paste("Saved to", output)
}