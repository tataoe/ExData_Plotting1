#Plot 3

with(churn, plot(Sub_metering_1,type = "n",xaxt = "n", xlab = "", ylab =""))

# Add the legends     
legend("topright", pch = "_", col = c("black", "red", "blue"),
  legend = c("Sub_metering_1 ", "Sub_metering_2", "Sub_metering_3"))

with(churn, points(Sub_metering_1, type = "l", col = "black",
                   xlab = "", ylab = "Energy sub metering"))
with(churn, points(Sub_metering_2, type = "l", col = "red",
                 xlab = "", ylab = "Energy sub metering"))
with(churn, points(Sub_metering_3,type = "l", col = "blue",
                 xlab = "", ylab = "Energy sub metering"))

axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))     

#Copy plot in png format
dev.copy(png,file = "plot3.png", width = 480, height = 480)
dev.off()
