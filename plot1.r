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

#Open device
#Note: Background is set to transparent as per the general consensus based on the Coursera discussion forum
png("plot1.png", height = 480, width = 480, bg = "transparent")

#Plotting the histogram
hist(hpc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim=c(0,1200))

#Close device
dev.off()

