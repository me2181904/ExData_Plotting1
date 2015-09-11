# seting up the working directory
setwd('~/Desktop/Coursera/Github/Repos/ExData_Plotting1')

# loading data
source('get_tidy_data.R')

# opening device
png(filename='plot2.png',width=480,height=480,units='px')

# plotting data
plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# closing device
x<-dev.off()