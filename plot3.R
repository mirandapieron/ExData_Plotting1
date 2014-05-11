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

## Make sub-metering columns numeric for plotting
datasubset_numeric_sub1<-as.numeric(as.character(datasubset[,7]))
datasubset[,7]<-datasubset_numeric_sub1
datasubset_numeric_sub2<-as.numeric(as.character(datasubset[,8]))
datasubset[,8]<-datasubset_numeric_sub2
datasubset_numeric_sub3<-as.numeric(as.character(datasubset[,9]))
datasubset[,9]<-datasubset_numeric_sub3

## Create png of plot3  
png(filename = "plot3.png", width = 480, height = 480)
plot.new()
plot(datasubset$DateTime,datasubset$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(datasubset$DateTime,datasubset$Sub_metering_1,col="black")
lines(datasubset$DateTime,datasubset$Sub_metering_2,col="red")
lines(datasubset$DateTime,datasubset$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
dev.off()