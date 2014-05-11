# need headers and data or first and second days of Feb 2007
hpc = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

# formatting a date/time variable or x-axis of plot
hpc$DateTime = as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

png('plot3.png',width=480,height=480)

plot(hpc$Sub_metering_1 ~ hpc$DateTime, type='l', ylab='Energy sub metering',xlab='')
lines(hpc$Sub_metering_2 ~ hpc$DateTime, type='l', col='Red')
lines(hpc$Sub_metering_3 ~ hpc$DateTime, type='l', col='Blue')

legendNames=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legendColors=c('Black','Red','Blue')
legend('topright',legend=legendNames, lty=c(1,1), col=legendColors)

dev.off()
