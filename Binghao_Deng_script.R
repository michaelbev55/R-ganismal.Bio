library(ggplot2)
library(tidyverse)

#Q1: A dat variable containing the scales dataset.
dat <- read.csv("scales.csv")

#Q2: A line of code which reports the class of each column in the dataset.
sapply(dat,class)

#Q3: A line of code which reports the dimensions of the dataset.
dim(dat)

#Q4: Code that produces a summary of the number of scales punctured for each species.
scale_punc_sum <- dat %>%
  group_by(species) %>%
  summarise(n = n())
scale_punc_sum

#Q5: Code that produces a summary of the number of specimens sampled for each species.
dat %>% 
  count(species,specimen) %>%
  print() %>%
  count(species,name = "n.specimens")

#Q6: Code that produces a PDF file containing 6 figures,
#one for each species that includes a boxplot of puncture force verus quadrant.
dat$species <- as.factor(dat$species)
species <- levels(dat$species)
for(i in species){
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}

pdf("Binghao_Deng_species_quadrant.pdf")
for(i in species){
  p <- dat %>%
    filter(species==i)%>%
    ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}
dev.off()

list.files(pattern=".pdf")


