#######################
#title:
#description:
#input(s):
#output(s):
######################

getwd()
library(ggplot2)
install.packages("jpeg")
library(jpeg)
library(png)
library(grid)
install.packages("grid")

court_file<-"../images/nba-court.jpg"

court_image<-rasterGrob(
  readJPEG(court_file),
  width=unit(1,"npc"),
  height=unit(1,"npc")
)

setwd("../images")
iguodala_scatterplot<-ggplot(iguodala)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point((aes(x=x,y=y,color=shot_made_flag)))+
  ylim(-50,420)+
  ggtitle(('Shot Chart: Andre Iguodala(2016 season)'))+
  theme_minimal()
pdf("andre-iguodala-shot-chart.pdf",width=6.5,height=5)
iguodala_scatterplot
dev.off()

green_scatterplot<-ggplot(green)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point((aes(x=x,y=y,color=shot_made_flag)))+
  ylim(-50,420)+
  ggtitle(('Shot Chart: Draymond Green(2016 season)'))+
  theme_minimal()
pdf("draymond-green-shot-chart.pdf",width=6.5,height=5)
green_scatterplot
dev.off()

durant_scatterplot<-ggplot(durant)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point((aes(x=x,y=y,color=shot_made_flag)))+
  ylim(-50,420)+
  ggtitle(('Shot Chart: Kevin Durant(2016 season)'))+
  theme_minimal()
pdf("kevin-durant-shot-chart.pdf",width=6.5,height=5)
durant_scatterplot
dev.off()

thompson_scatterplot<-ggplot(thompson)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point((aes(x=x,y=y,color=shot_made_flag)))+
  ylim(-50,420)+
  ggtitle(('Shot Chart: Klay Thompson(2016 season)'))+
  theme_minimal()
pdf("klay-thompson-shot-chart.pdf",width=6.5,height=5)
thompson_scatterplot
dev.off()

curry_scatterplot<-ggplot(curry)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point((aes(x=x,y=y,color=shot_made_flag)))+
  ylim(-50,420)+
  ggtitle(('Shot Chart: Stephen Curry(2016 season)'))+
  theme_minimal()
pdf("stephen-curry-shot-chart.pdf",width=6.5,height=5)
curry_scatterplot
dev.off()

shots_scatterplot<-ggplot(shots_data)+
  annotation_custom(court_image,-250,250,-50,420)+
  geom_point((aes(x=x,y=y,color=shot_made_flag)))+
  ylim(-50,420)+
  ggtitle(('Shot Chart: GSW(2016 season)'))+
  theme_minimal()+
  facet_wrap(~player)+
  theme(legend.position = "top")
shots_scatterplot

pdf("gsw-shots-chart.pdf",width=8,height=7)
shots_scatterplot
dev.off()

png("gsw-shots-chart.png",width=8,height=7,units = "in",res=500)
shots_scatterplot
dev.off()



