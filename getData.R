getData <- function(nbRows=-1) {
  file <- "household_power_consumption.txt"
  rawData <-read.table(file, header=T, sep=";", nrows=nbRows, na.strings = "?", 
                     colClasses=c("character", "character", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", "numeric", "numeric"))
  retData = subset(rawData, Date == "1/2/2007" | Date == "2/2/2007")
  retData$DateTime <- as.POSIXct(paste(retData$Date, retData$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")
  return (retData)
}
