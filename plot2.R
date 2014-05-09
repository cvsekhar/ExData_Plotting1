script.dir <- dirname(sys.frame(1)$ofile)

source(paste(script.dir,"/readFile.R",sep=""))

# this function is used to generate the plot2
plot2 <- function(data,name=" (Kilowatts)"){  
  c <- paste ("Global Active Power",name,sep="")
  plot(data$dateTime,data$Global_active_power,  xlab="", 
       ylab=c, type="l")  
}

# this function is used to generate the plot2 and write to file plot1.png
plot2ToPng <- function(filename="household_power_consumption.txt"){  
  data <- readData(filename)
  png(file="plot2.png",width = 480, height = 480)
  plot2(data)  
  dev.off()
}