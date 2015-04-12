source("getData.R")
#
#  Parameters
#  Data frame as input.  If not passed, it will call getData() to load
#   See Readme for details on data frame structure.  
#  StandAlone -- If T, then it will create 1x1 plot area and 
#   save the PGN file.  (False means caller performs these functions)
#
plot2 <- function(data = data.frame(), standAlone=T) {
  if (nrow(data) == 0) {
    data <- getData()
  }
  
  if (standAlone) {
    par(mfcol=c(1,1))
  }
  
  plot(data$DateTime, data$Global_active_power, type="l", xlab = "", ylab="Global Active power (kilowatts)")
  if (standAlone) {
    dev.copy(png, file="plot2.png", width=480, height=480)  
    dev.off()
  }
  
   
}
