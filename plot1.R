# setting up the working directory
setwd('~/Desktop/Coursera/Github/Repos/ExData_Plotting1')

# loading the data
source('get_tidy_data.R')

# opening device
png(filename='plot1.png',width=480,height=480,units='px')

# plotting data
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turning off device
x<-dev.off()

