library(ggplot2)
library(tidyverse)

# 1. dat variable containing scales data
dat <- read.csv("scales.csv")

# 2. reports class of columns in dataset
sapply(dat,class)

# 3. reports dimensions of dataset
dim(dat)

# 4. summarizes number of scales per species
species.n <- dat %>%
  group_by(species) %>%
  summarize(n=n())
species.n

# 5. summarizes number of specimens per species
dat %>%
  count(species,specimen) %>%
  count(species,name="n.specimens")

# 6. produces the PDF file containing the six box plots
pdf("species_quadrant.pdf")
for(i in species){
  p <- dat %>%
  filter(species==i) %>%
  ggplot()+geom_boxplot(aes(x=quadrant,y=N))+ggtitle(i)
  print(p)
}
list.files(pattern=".pdf")
