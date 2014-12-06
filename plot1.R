#This R script read in the household_poower_consumption.txt csv file and plot the histogram 
#of the Global Active Power (kilowatts) variable
#A png file of the histogram would be generated in /figure directory

#read in data file from parent directory. It is done in this way so that the data file will not
#be upload to github. If want to read data from current directory, just remove "../".
data=read.csv2("../household_power_consumption.txt",header=TRUE,colClasses="character",na.string="?")
data[,"Date"]<-as.Date(data[,"Date"],"%d/%m/%Y")
startdate<-as.Date("01/02/2007","%d/%m/%Y")
enddate<-as.Date("02/02/2007","%d/%m/%Y")
mydata<-data[data$Date==startdate |data$Date==enddate ,]
rm(data)

mydata[,3]<-as.numeric(mydata[,3])
png(file="plot1.png")
with(mydata, hist(Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)"))
dev.off()