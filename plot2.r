setwd("C:/Users/Administrator/Desktop/Coursera/Data Science (John Hopkins)/04 Exploratory Data Analysis/Assignment/Project 1")

directory <- "C:/Users/Administrator/Desktop/Coursera/Data Science (John Hopkins)/04 Exploratory Data Analysis/Assignment/Project 1"
filepath <- file.path(directory,"household_power_consumption.txt")

#Reading the column names of household_power_consumption.txt
hpc_header <- read.table(filepath, sep=";", header=FALSE, nrows = 1)

#Reading the data of household_power_consumption for Feb 1 to 2, 2007
hpc <- read.table(filepath, sep=";", header=FALSE, nrows = 2880, skip=66637)

#Assigning the column names to the hpc data frame
for(i in seq_along(hpc_header)) 
{
	colnames(hpc)[i] <- toString(hpc_header[1,i])
}

#Combining date & time columns into a list
datetime_list <- paste(hpc$Date, hpc$Time)
datetime <- strptime(datetime_list, "%d/%M/%Y %H:%M:%S")

#Convert date & time list into a dataframe and append to the household_power_consumption data frame
dtdf <- as.data.frame(datetime)
colnames(dtdf)[1] <- "DateTime"
hpc <- cbind(hpc, dtdf)

#Open device
#Note: Background is set to transparent as per the general consensus on the Coursera discussion forum
png("plot2.png", height = 480, width = 480, bg = "transparent")

#Plotting the line graph
plot(x=hpc$DateTime,y=hpc$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

#Close device
dev.off()