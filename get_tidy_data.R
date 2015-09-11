# seting up the working directory
setwd('~/Desktop/Coursera/Github/Repos/ExData_Plotting1')

# required packages
library(data.table)
library(lubridate)

# making sure the data folder exists
if (!file.exists('data')) {
        dir.create('data')
}

# checking to see if the existing tidy data set exists; if not, make it...
if (!file.exists('data/power_consumption.txt')) {
        
        # downloading the zip file and unziping
        file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        download.file(file.url,destfile='data/power_consumption.zip')
        unzip('data/power_consumption.zip',exdir='data',overwrite=TRUE)
        
        # reading the raw table and limit to 2 days
        variable.class<-c(rep('character',2),rep('numeric',7))
        power.consumption<-read.table('data/household_power_consumption.txt',header=TRUE,
                                      sep=';',na.strings='?',colClasses=variable.class)
        power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
        
        # cleaning up the variable names and convert date/time fields
        cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
                'SubMetering1','SubMetering2','SubMetering3')
        colnames(power.consumption)<-cols
        power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
        power.consumption<-power.consumption[,c(10,3:9)]
        
        # writing a clean data set to the directory
        write.table(power.consumption,file='data/power_consumption.txt',sep='|',row.names=FALSE)
} else {
        
        power.consumption<-read.table('data/power_consumption.txt',header=TRUE,sep='|')
        power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
        
}

# removing the large raw data set 
if (file.exists('data/household_power_consumption.txt')) {
        x<-file.remove('data/household_power_consumption.txt')
}