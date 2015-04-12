source("getData.R")
#
#  Parameters
#  Data frame as input.  If not passed, it will call getData() to load
#   See Readme for details on data frame structure.  
#  StandAlone -- If T, then it will create 1x1 plot area and 
#   save the PGN file.  (False means caller performs these functions)
#
plot3 <- function(data = data.frame(), standAlone=T) {
  if (nrow(data) == 0) {
    data <- getData()
  }
  
  if (standAlone) {
    par(mfcol=c(1,1))
  }
  
  plot(data$DateTime, data$Sub_metering_1, type="n", ylab="Engrgy sub meeting", xlab="")
  points(data$DateTime, data$Sub_metering_1, type="l")
  points(data$DateTime, data$Sub_metering_2, type="l", col = "red")
  points(data$DateTime, data$Sub_metering_3, type="l", col = "blue")
  legend("topright", pch="---", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  if (standAlone) {
    dev.copy(png, file="plot3.png", width=480, height=480)  
    dev.off()    
  }

}
