script.dir <- dirname(sys.frame(1)$ofile)

source(paste(script.dir,"/readFile.R",sep=""))

# this function is used to generate the plot3
plot3 <- function(d){  
  with(d, plot(d$dateTime,d$Sub_metering_1,type="n",xlab="",
               ylab="Energy Sub Metering"))
  with(d, lines(d$dateTime, d$Sub_metering_1,type="l"))
  with(d, lines(d$dateTime, d$Sub_metering_2,type="l",col="red"))
  with(d, lines(d$dateTime, d$Sub_metering_3,type="l",col="blue"))
  legend("topright",pch="-",col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
}

# this function is used to generate the plot3.png and write to file plot1.png
plot3ToPng <- function(filename="household_power_consumption.txt"){  
  data <- readData(filename)
  png(file="plot3.png",width = 480, height = 480)
  plot3(data)  
  dev.off()
}