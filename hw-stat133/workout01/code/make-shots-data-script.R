#######################
#title:Make-shots-data-script
#description:Reading the downloaded gsw players csv data files as data frames. Modifying and adding some variables to help following analysis and outputting the summaries of the data. 
#input(s):andre-iguodala.csv;draymond-green.csv;kevin-durant.csv;klay-thompson.csv;stephen-curry.csv
#output(s):andre-iguodala-summary.txt;draymond-green-summary.txt;kevin-durant-summary.txt;klay-thompson-summary.txt;stephen-curry-summary.txt
#######################

setwd("~/../Desktop/hw-stat133")
library(dplyr)
#reading files
iguodala<-read.csv("./workout01/data/andre-iguodala.csv", stringsAsFactors=F)
green<-read.csv("./workout01/data/draymond-green.csv", stringsAsFactors=F)
durant<-read.csv("./workout01/data/kevin-durant.csv", stringsAsFactors=F)
thompson<-read.csv("./workout01/data/klay-thompson.csv", stringsAsFactors=F)
curry<-read.csv("./workout01/data/stephen-curry.csv", stringsAsFactors=F)

#add a column name
iguodala$player<-c(rep("Andre Iguodala",nrow(iguodala)))
green$player=c(rep("Draymond Green",nrow(green)))
durant$player=c(rep("Kevin Durant",nrow(durant)))
thompson$player=c(rep("Klay Thompson",nrow(thompson)))
curry$player=c(rep("Stephen Curry",nrow(curry)))

#change the original values of shot-made-flag
##iguodala
n1=iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]
iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]<-c(rep("shot_no",length(n1)))
y1=iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]<-c(rep("shot_yes",length(y1)))

##green
n2=green$shot_made_flag[green$shot_made_flag=="n"]
green$shot_made_flag[green$shot_made_flag=="n"]<-c(rep("shot_no",length(n2)))
y2=green$shot_made_flag[green$shot_made_flag=="y"]
green$shot_made_flag[green$shot_made_flag=="y"]<-c(rep("shot_yes",length(y2)))

##durant
n3=durant$shot_made_flag[durant$shot_made_flag=="n"]
durant$shot_made_flag[durant$shot_made_flag=="n"]<-c(rep("shot_no",length(n3)))
y3=durant$shot_made_flag[durant$shot_made_flag=="y"]
durant$shot_made_flag[durant$shot_made_flag=="y"]<-c(rep("shot_yes",length(y3)))

##thompson
n4=thompson$shot_made_flag[thompson$shot_made_flag=="n"]
thompson$shot_made_flag[thompson$shot_made_flag=="n"]<-c(rep("shot_no",length(n4)))
y4=thompson$shot_made_flag[thompson$shot_made_flag=="y"]
thompson$shot_made_flag[thompson$shot_made_flag=="y"]<-c(rep("shot_yes",length(y4)))

##curry
n5=curry$shot_made_flag[curry$shot_made_flag=="n"]
curry$shot_made_flag[curry$shot_made_flag=="n"]<-c(rep("shot_no",length(n5)))
y5=curry$shot_made_flag[curry$shot_made_flag=="y"]
curry$shot_made_flag[curry$shot_made_flag=="y"]<-c(rep("shot_yes",length(y5)))

#add a column minite
iguodala$minite=iguodala$period*12-iguodala$minutes_remaining
green$minite=green$period*12-green$minutes_remaining
durant$minite=durant$period*12-durant$minutes_remaining
thompson$minite=thompson$period*12-thompson$minutes_remaining
curry$minite=curry$period*12-curry$minutes_remaining

#outpuu data frames into individual text files
setwd("./workout01/output")
sink("andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink("draymond-green-summary.txt")
summary(green)
sink()

sink("kevin-durant-summary.txt")
summary(durant)
sink()

sink("klay-thompson-summary.txt")
summary(thompson)
sink()

sink("stephen-curry-summary.txt")
summary(curry)
sink()

#stack tables into one data frame
shots_data<-rbind(iguodala,green[,],durant[,],thompson[,],curry[,])
#export table as CSV
setwd("../data")
write.csv(shots_data,"shots-data.csv")
#output the summary of shots-data
setwd("../output")
sink("shots-data-summary.txt")
summary(shots_data)
sink()

setwd("~/../Desktop/hw-stat133")
