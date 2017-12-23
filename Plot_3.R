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

plot(c(1:length(xx$Sub_metering_1)),xx$Sub_metering_1,type="o",pch=".",xaxt="n",ylab="Energy sub metering",xlab="")
axis(side=1,at=seq(0,2880,1440),labels = c("Thu","Fri","Sat"))
lines(xx$Sub_metering_2,type="o",pch=".",col="red")
lines(xx$Sub_metering_3,type="o",pch=".",col="blue")
legend(2200,38,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=1)
dev.copy(png,file="plot_3.png");dev.off()

