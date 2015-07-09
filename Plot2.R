#Plot 2
library(lubridate)
churn$Date = ymd(churn$Date)
#churn$Time = hms(churn$Time)

#churn$day_name = weekdays(churn$Date)

with(churn, plot(Global_active_power,type = "l",
                 xlab = "", ylab = "Global Active Power (kilowatts)",xaxt = "n"))
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

#Copy plot in png format
dev.copy(png,file = "plot2.png", width = 480, height = 480)
dev.off()
