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

hist(yy,col="red",xlab = "Global Active Power (kilowatts)", main="Global Active Power");dev.copy(png,file="plot_1.png");dev.off()
