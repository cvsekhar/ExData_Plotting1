script.dir <- dirname(sys.frame(1)$ofile)

source(paste(script.dir,"/readFile.R",sep=""))
source(paste(script.dir,"/plot2.R",sep=""))
source(paste(script.dir,"/plot3.R",sep=""))

# this function is used to generate the plot4TopRight
plot4TopRight <- function(d){  
  plot(d$dateTime,d$Voltage,  xlab="datetime", 
       ylab="Voltage", type="l")  
}

# this function is used to generate the plot4BottomRight
plot4BottomRight <- function(d){  
  plot(d$dateTime,d$Global_reactive_power,  xlab="datetime", 
       ylab="Global_reactive_power", type="l")  
}

#this function generates plot4.png it uses 
#  plot2 function
#  plot4TopRight function
#  plot3 function
#  plot4BottomRight function
plot4ToPng <- function(filename="household_power_consumption.txt"){  
  data <- readData(filename)
  png(file="plot4.png",width = 480, height = 480)
  par(mfrow=c(2,2))
  plot2(data,"")  
  plot4TopRight(data)
  plot3(data,"n")
  plot4BottomRight(data)
  dev.off()
}