data=read.csv2("household_power_consumption.txt",header=TRUE,colClasses="character",na.string="?")
data[,"Date"]<-as.Date(data[,"Date"],"%d/%m/%Y")
startdate<-as.Date("01/02/2007","%d/%m/%Y")
enddate<-as.Date("02/02/2007","%d/%m/%Y")
mydata<-data[data$Date==startdate |data$Date==enddate ,]
mydata[complete.cases(mydata[3]),]
x<-paste(mydata[,1],mydata[,2])
tt<-strptime(x,"%Y-%m-%d %H:%M:%S")
rm(data)

mydata[,3]<-as.numeric(mydata[,3])

png(file="figure/plot2.png")
plot(c(1:length(x)),mydata[,3],main="Global Active Power",
     col="black",xlab=NULL,type="l",axes=FALSE,ann=FALSE)
axis(1,at=c(1,length(x)/2,length(x)),c("Thu","Fri","Sat"))
axis(2,las=0,at=c(0,2,4,6,8))
title(ylab="Global Active Power (kilowatts)")
#title(xlab="")
box()
dev.off()