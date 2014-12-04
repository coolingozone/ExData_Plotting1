#This R script read in the household_poower_consumption.txt csv file and plot the line plot 
#of the Global Active Power (kilowatts) variable VS datetime for the submeter 1 to 3
#A png file of the graph would be generated in /figure directory


data=read.csv2("../household_power_consumption.txt",header=TRUE,colClasses="character",na.string="?")
data[,"Date"]<-as.Date(data[,"Date"],"%d/%m/%Y")
startdate<-as.Date("01/02/2007","%d/%m/%Y")
enddate<-as.Date("02/02/2007","%d/%m/%Y")
mydata<-data[data$Date==startdate |data$Date==enddate ,]
mydata[complete.cases(mydata[3]),]
x<-paste(mydata[,1],mydata[,2])
tt<-strptime(x,"%Y-%m-%d %H:%M:%S")
rm(data)

mydata[,3]<-as.numeric(mydata[,3])

png(file="figure/plot3.png")
#par(new=F)
plot(c(1:length(x)),mydata[,7],main="Global Active Power",
     col="black",type="l",axes=FALSE,ann=FALSE)
lines(mydata[,8],col="red")
lines(mydata[,9],col="blue")
#plot(mydata[,8],col="red",type="l",axes=FALSE)
#plot(mydata[,9],col="blue",type="l",axes=FALSE)
axis(1,at=c(1,length(x)/2,length(x)),c("Thu","Fri","Sat"))
axis(2,las=0,at=c(0,10,20,30,40))
title(ylab="Global Active Power (kilowatts)")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty=c(1,1),lwd=c(2.5,2.5))
#title(xlab="")
box()
dev.off()