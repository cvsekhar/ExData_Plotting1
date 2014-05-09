script.dir <- dirname(sys.frame(1)$ofile)

source(paste(script.dir,"/readFile.R",sep=""))

# this function is used to generate the plot1
plot1 <- function(data){  
  hist(data$Global_active_power,col="red",
       main="Global Active Power", xlab="Global Active Power (Kilowatts)")  
}

# this function is used to generate the plot1 and write to file plot1.png
plot1ToPng <- function(filename="household_power_consumption.txt"){  
  data <- readData(filename)
  png(file="plot1.png",width = 480, height = 480)
  plot1(data)  
  dev.off()
}


