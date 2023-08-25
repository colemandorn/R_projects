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

# Calculate batting average and create a new column 'BAvg'
cubs_batting <- cubs_batting %>%
  mutate(BAvg = H / AB)

#calculate num of singles
cubs_batting <- cubs_batting %>%
  mutate(`1B` = H - `2B` - `3B` - HR)

# Calculate WOBA w/ 8/24/23 cf
cubs_batting <- cubs_batting %>%
  mutate(WOBA = (((.696*BB)+(.726*HBP)+(.883*`1B`)+(1.245*`2B`)+(1.571*`3B`)+(2.007*HR))/(AB+BB-IBB+SF+HBP)))

# WOBA - OBP
cubs_batting <- cubs_batting %>%
  mutate(`WOBA+-` = WOBA - OBP)



