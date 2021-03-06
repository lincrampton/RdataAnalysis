# get header and data for first and second days of Feb 2007
hpc = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

# need formatted date for date/time x-axis of plot
hpc$DateTime = as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

png('plot2.png',width=480,height=480)
plot(hpc$Global_active_power ~ hpc$DateTime, type='l', ylab='Global Active Power (kilowatts)',xlab='')
dev.off()


