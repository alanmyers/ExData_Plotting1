source("getData.R")
#
#  Parameters
#  Data frame as input.  If not passed, it will call getData() to load
#   See Readme for details on data frame structure.  
#  StandAlone -- If T, then it will create 1x1 plot area and 
#   save the PGN file.  (False means caller performs these functions)
#  
#
plot1 <- function(data = data.frame(), standAlone=T) {
  if (nrow(data) == 0) {
    data <- getData()
  }
  
  if (standAlone) {
    par(mfcol=c(1,1))
  }
  hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
  if (standAlone) {
    dev.copy(png, file="plot1.png", width=480, height=480)  
    dev.off()
  }
  
  
}
