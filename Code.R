download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2",
              "StormData.csv.bz2")

##cache = TRUE

library(ggplot2)
library(dplyr)
library(data.table)

stormdata <- data.table(read.csv("StormData.csv.bz2"))

storms2 <- storms2 %>% mutate(event.year=format(strptime(BGN_DATE, "%m/%d/%Y"),"%Y")
                              ,crop.damage.dollars=ifelse(CROPDMGEXP=="B",CROPDMG*1000000000,ifelse(CROPDMGEXP=="M",CROPDMG*1000000,ifelse(CROPDMGEXP=="K",CROPDMG*1000,CROPDMG))),
                              property.damage.dollars=ifelse(PROPDMGEXP=="B",PROPDMG*1000000000,ifelse(PROPDMGEXP=="M",PROPDMG*1000000,ifelse(PROPDMGEXP=="K",PROPDMG*1000,PROPDMG))),
                              total.damage.dollars.thousand=round((property.damage.dollars+crop.damage.dollars)/1000,0))

storms2 <- storms2 %>% filter(event.year >= 2001,total.damage.dollars.thousand<100000000)

events.by.damage <- stormdata2 %>% group_by(EVTYPE) %>% summarise(total.damage.dollars.thousand=sum(total.damage.dollars.thousand)) %>% arrange(desc(total.damage.dollars.thousand))

top.events.by.damage <- events.by.damage[1:10,]

c <- ggplot(top.events.by.damage, aes(x=EVTYPE, y=top.events.by.damage))

c + geom_bar(stat="identity") + coord_flip()

