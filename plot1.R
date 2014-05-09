hpc = read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
attach(hpc)
png('plot1.png',width=480,height=480)
hist(Global_active_power, col='Red', main='Global Active Power', xlab='Global Active Power (kilowatts)')
dev.off()

