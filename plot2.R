## Read data file
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

## Set first column as Dates
data[,1]<-as.Date(data[,1],"%d/%m/%Y")

## Subset the required dates
datasubset<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

## Paste date and time together and use strptime()
DateTime_paste<-paste(datasubset[,1],datasubset[,2],sep=" ")
DateTime<-strptime(DateTime_paste,format="%Y-%m-%d %H:%M:%S")

## Add DateTime column with striptime() values to data frame
datasubset["DateTime"]<-as.POSIXct(DateTime)

## Make third column numeric for plotting
datasubset_numeric<-as.numeric(as.character(datasubset[,3]))
datasubset[,3]<-datasubset_numeric

## Create png of plot2  
png(filename = "plot2.png", width = 480, height = 480)
plot.new()
plot(datasubset$DateTime,datasubset$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(datasubset$DateTime,datasubset$Global_active_power)
dev.off()