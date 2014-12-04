data=read.csv2("household_power_consumption.txt",header=TRUE,colClasses="character",na.string="?")
data[,"Date"]<-as.Date(data[,"Date"],"%d/%m/%Y")
startdate<-as.Date("01/02/2007","%d/%m/%Y")
enddate<-as.Date("02/02/2007","%d/%m/%Y")
mydata<-data[data$Date==startdate |data$Date==enddate ,]
rm(data)

mydata[,3]<-as.numeric(mydata[,3])
png(file="figure/plot1.png")
with(mydata, hist(Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)"))
dev.off()