## Read data file
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

## Set first column as Dates
data[,1]<-as.Date(data[,1],"%d/%m/%Y")

## Subset the required dates
datasubset<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

## Make third column numeric
datasubset_numeric<-as.numeric(as.character(datasubset[,3]))
datasubset[,3]<-datasubset_numeric

## Create png of histogram  
png(filename = "plot1.png", width = 480, height = 480)
hist(datasubset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()