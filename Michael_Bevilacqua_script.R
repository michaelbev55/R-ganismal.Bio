library(ggplot2)
library(tidyverse)

dat <- read.csv("scales.csv")
sapply(dat,class)
dim(dat)


dat %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

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
