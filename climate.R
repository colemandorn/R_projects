library(tidyverse)
library(rmarkdown)

climate <- read_csv('hendersonville8-23-14to8-23-23.csv')

View(climate)

bent <- climate %>% 
  filter(STATION == 'USC00310724')


sum_prcp <- bent %>% filter(!is.na(PRCP)) %>% summarise(total_prcp = sum(PRCP))
