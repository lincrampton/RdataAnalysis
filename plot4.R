# need headers and data for first and second day of Feb 2007
hpc = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

# need formatted date for X-axis of plots
hpc$DateTime = as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

attach(hpc)  # this line may be deprecated

png('plot4.png',width=480,height=480)
par(mfrow = c(2,2))

#plot1
plot(hpc$Global_active_power ~ hpc$DateTime, type='l', ylab='Global Active Power',xlab='')

#plot2
plot(hpc$Voltage ~ hpc$DateTime, type='l', ylab='Voltage',xlab='datetime')

#plot3
plot(hpc$Sub_metering_1 ~ hpc$DateTime, type='l', ylab='Energy sub metering',xlab='')
lines(hpc$Sub_metering_2 ~ hpc$DateTime, type='l', col='Red')
lines(hpc$Sub_metering_3 ~ hpc$DateTime, type='l', col='Blue')

legendNames=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
legendColors=c('Black','Red','Blue')
legend('topright',legend=legendNames, lty=c(1,1), lwd=2, col=legendColors, bty='n', cex=0.6)

#plot4
plot(hpc$Global_reactive_power ~ hpc$DateTime, type='l', ylab='Global_reactive_power',xlab='datetime')

dev.off()


