library(XML)
library(httr)
library(qpcR)
library(httr)
library(rvest)
library(V8)
library(gdata)
library(dplyr)
library(readr)
library(tidyr)
library(lubridate)
library(lattice)

file_hpc<-"R_wd//household_power_consumption.txt"
xx<-read.table(file_hpc,header=TRUE,sep=";",na.strings="?")
xx$Date<-as.Date(strptime(xx$Date,"%d/%m/%Y"))
xx<-xx[xx$Date=="2007-02-01" | xx$Date=="2007-02-02",]
yy<-as.numeric(xx$Global_active_power)/500

par(mfrow=c(2,2))

xz<-xx
xz$Date<-format(xx$Date,format="%a")
plot(xz$Global_active_power,type="o",pch=".",xaxt="n",ylab="Global Active Power (kilowatts)",xlab="")
axis(side=1,at=seq(0,2880,1440),labels = c("Thu","Fri","Sat"))
  
plot(c(1:length(xz$Voltage)),xz$Voltage,type="o",pch=".",xaxt="n",ylab="Voltage",xlab="datetime")
axis(side=1,at=seq(0,2880,1440),labels = c("Thu","Fri","Sat"))
 
plot(c(1:length(xz$Sub_metering_1)),xz$Sub_metering_1,type="o",pch=".",xaxt="n",ylab="Energy sub metering",xlab="")
axis(side=1,at=seq(0,2880,1440),labels = c("Thu","Fri","Sat"))
lines(xz$Sub_metering_2,type="o",pch=".",col="red")
lines(xz$Sub_metering_3,type="o",pch=".",col="blue")
legend(2000,38,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.7)
  
plot(c(1:length(xz$Global_reactive_power)),xz$Global_reactive_power,type="o",pch=".",xaxt="n",ylab="Global reactive power",xlab="datetime")
axis(side=1,at=seq(0,2880,1440),labels = c("Thu","Fri","Sat"))
dev.copy(png,file="plot_4.png");dev.off()
