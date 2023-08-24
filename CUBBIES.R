library(tidyverse)


cubs_batting <- read_csv('chc_batting_8-24.csv')


View(cubs_batting)

head(cubs_batting)

cubs_batting <- cubs_batting %>%
  filter(Pos != "P")

hbp_plot <- ggplot(data = filter(cubs_batting, HBP > 0)) +
  geom_point(mapping=aes(x = reorder(Name,HBP), y = HBP), color = "blue") +
  labs(title = "Cubs Hit by Pitch", x = "Player") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

