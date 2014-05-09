# This function reads the files, cleans the data and transfroms
# the data

readData <- function(filename="household_power_consumption.txt"){
  
  colclasses <- c("character","character", "numeric",
                  "numeric","numeric","numeric",
                  "numeric","numeric","numeric")
  
  #read from the file convert all ? to strings
  d <- read.table(filename, sep=";", header=TRUE, colClasses=colclasses, 
                  na.strings="?")
  
  #### Cleaning
  
  #extract only the dates we are interested 2007/2/1 and 2007/2/2
  d <- d[(as.Date(d$Date,format="%d/%m/%Y") > as.Date("2007-01-31") & 
            as.Date(d$Date,format="%d/%m/%Y") < as.Date("2007-02-03")),]
  
  ##### Transforming
  
  #concatenate the date and time into a dateTime column
  d$dateTime <- apply(d[,c("Date","Time")],1,function(x) paste(x[[1]],x[[2]],
                                                               sep=" "))
  
  #convert the datetime column to posix format
  d$dateTime <- strptime(d[,c("dateTime")], format="%d/%m/%Y %H:%M:%S")
  
  d  
}