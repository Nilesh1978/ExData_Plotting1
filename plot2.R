library(dplyr)

# load data
dat<- read.table("household_power_consumption.txt", sep=";", header = TRUE,na.strings ="?")
head(dat)
str(dat)
sapply(dat, class)

# change date format
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
tail(dat)

# subset data to include only the needed data for 2 days
dat2<- dat %>% filter(Date=="2007-02-01"|Date=="2007-02-02")
str(dat2)

# drop levels and store data in a new frame
dat3<- droplevels(dat2)
str(dat3)
head(dat3)
sapply(dat3, nlevels)

# paste date and time and convert the new combined variable to Dat/Time variable usind strptime function
dat3$timetemp <- paste(dat3$Date, dat3$Time)
dat3$DateTime <- strptime(dat3$timetemp, format = "%Y-%m-%d %H:%M:%S")

# create plot2
plot(dat3$DateTime, dat3$Global_active_power, type="l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png") # copy plot to png file
dev.off() # close the pdf/png file device

