library(ggplot2)
library(tidyverse)
setwd("/Users/ElisabethLaviolette/Desktop/R.ganismal.Bio")

#1.
dat <- read.csv("scales.csv")

#2.
sapply(dat,class)

#3.
dim(dat)

#4.
species.n<- dat %>%
  group_by(species) %>%
  summarise(n = n())
species.n

#5.
dat$species <- as.factor(dat$species)
species <- levels(dat$species)
dat %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

#6.
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




