download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              "StormData.csv.bz2")

##cache = TRUE

library(ggplot2)
library(dplyr)
library(data.table)

stormdata <- data.table(read.csv("StormData.csv.bz2"))
