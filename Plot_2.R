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

plot(yy,type="o",pch=".",xaxt="n",ylab="Global Active Power (kilowatts)",xlab="")
axis(side=1,at=seq(0,2880,1440),labels = c("Thu","Fri","Sat"))
dev.copy(png,file="plot_2.png");dev.off()
