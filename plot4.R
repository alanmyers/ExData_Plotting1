source("getData.R")
#
#  Acccepts a data frame as input.  If not passed, it will call getData() to load
#  See Readme for details on data frame structure.
#
plot4 <- function(data = data.frame()) {
  if (nrow(data) == 0) {
    data <- getData()
  }
  
  
  par(mfcol=c(2,2))
  plot2(data, standAlone=F)
  plot3(data, standAlone=F)
  plot(data$DateTime, data$Voltage, type="l", xlab = "datetime", ylab="Voltage")
  plot(data$DateTime, data$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file="plot4.png", width=480, height=480)  
  #dev.off(dev.prev())
  dev.off()
  
}
