library(ggplot2)
library(tidyverse)
setwd("/Users/bev/R-ganismalbio")

#Q1
dat <- read.csv("scales.csv")
#Q2
sapply(dat,class)
#Q3
dim(dat)

#Q4
species.n<- dat %>%
  group_by(species) %>%
  summarise(n = n())
species.n

#Q5
dat$species <- as.factor(dat$species)
species <- levels(dat$species)
dat %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

#Q6
for(i in species){
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}

pdf("species_quadrant.pdf")
for(i in species){
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}
dev.off()
list.files(pattern=".pdf")
