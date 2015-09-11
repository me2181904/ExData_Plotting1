# setting up the working directory
setwd('~/Desktop/Coursera/Github/Repos/ExData_Plotting1')

# loading data
source('get_tidy_data.R')

# opening device
png(filename='plot4.png',width=480,height=480,units='px')

# making 4 plots
par(mfrow=c(2,2))

# plotting data on top left (1,1)
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plotting data on top right (1,2)
plot(power.consumption$DateTime,power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plotting data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3])

# plotting data on bottom right (2,2)
plot(power.consumption$DateTime,power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

# closing device
x<-dev.off()