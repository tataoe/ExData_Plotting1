setwd("Desktop/DataScience/Coursera/JHU/3.Exploratory Data Analysis")
data = read.table("household_power_consumption.txt",sep = ";", header =T, stringsAsFactors = F, na.strings = "?")
colSums(is.na(data))

data = data[complete.cases(data),]
colSums(is.na(data))
View(data)

dim(data)
colnames(data)
str(data)

#Converting date and time 
install.packages("lubridate")

data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data$Date = ymd(data$Date)
data$Time = hms(data$Time)
class(data$Date)


#Subset data based on date between 2007-02-01 and 2007-02-02
asgndata = subset(data, Date == "2007-02-01" | Date == "2007-02-02")
View(asgndata)
str(asgndata)
write.table(asgndata, file="churn_data.txt", sep =";", row.names =F, col.names=T)

churn = read.table("churn_data.txt", header=T, sep = ";", stringsAsFactors = T)
View(churn)
str(churn)
#Our overall goal here is simply to examine how household energy usage varies over a 2-day
#period in February, 2007. Your task is to reconstruct the following plots below, all of 
#which were constructed using the base plotting system.

#churn$Time = paste(hour(churn$Time),minute(churn$Time),second(churn$Time),sep=":")

churn$Time <- parse_date_time(churn$Time ,"hms")
format(churn$Time , format="%H:%M:%S")



#Plot 1
with(churn, hist(Global_active_power, col="red",
                 xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
                 main ="Global Active Power"))

#Copy plot in png format
dev.copy(png,file = "plot1.png", width = 480, height = 480)
dev.off()
