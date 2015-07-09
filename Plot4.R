#opar = par()
#par = opar

#Set the par to 2,2 formmat
par(mfrow = c(2,2))

#Graph1
with(churn, plot(Global_active_power,type = "l",
                 xlab = "", ylab = "Global Active Power (kilowatts)",xaxt = "n"))
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#Graph2
with (churn, plot(Voltage, type = "l", xaxt = "n",  
                  xlab = "datetime", ylab = "Voltage"))
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))


#Graph3
with(churn, plot(Sub_metering_1,type = "n",xaxt = "n", xlab = "", ylab =""))

# Add the legends     
legend("topright", pch = "_", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

with(churn, points(Sub_metering_1, type = "l", col = "black",
                   xlab = "", ylab = "Energy sub metering"))
with(churn, points(Sub_metering_2, type = "l", col = "red",
                   xlab = "", ylab = "Energy sub metering"))
with(churn, points(Sub_metering_3,type = "l", col = "blue",
                   xlab = "", ylab = "Energy sub metering"))
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))  



#Graph4
with (churn, plot(Global_reactive_power, type = "l", ylim = c(0.0,0.5), xaxt = "n",  
                  xlab = "datetime", ylab = "Global_reactive_power"))
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#Copy plot in png format
dev.copy(png,file = "plot4.png", width = 480, height = 480)
dev.off()
