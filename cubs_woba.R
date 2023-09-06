library(tidyverse)

cubs_pitching <- read_csv('cubs_pitching.csv')
cubs_batting <- read_csv('chc_batting_8-24.csv')
#data from baseball reference

View(cubs_pitching)

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

# Pythagorean exp. wins & plot
total_runs_against <- sum(cubs_pitching$R)
total_runs <- sum(cubs_batting$R)
winshare <-  ((total_runs^2)/((total_runs^2)+(total_runs_against^2)))
xwins <- winshare * 162
xlosses <- 162 - xwins
winshare_df <- tibble(xwins,xlosses)
pythag_exp_wins_plot <- ggplot(data = winshare_df, aes(x=xlosses,y=xwins)) +
  geom_point() +
  theme_classic()



