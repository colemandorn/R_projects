library(cfbfastR)
library(tidyverse)

#Sys.setenv(CFBD_API_KEY = "YOUR-API-KEY-HERE")
Sys.setenv(CFBD_API_KEY = "")

wk1 <- (cfbd_pbp_data(2023, week = 1, epa_wpa = TRUE))

View(wk1)

fg_wk1 <- wk1 %>%
  filter(play_type %in% c("Field Goal Good", "Field Goal Missed")) %>%
  group_by(kicker = fg_kicker_player_name) %>%
  summarise(total_EPA = sum(EPA, na.rm = TRUE))



#select(kicker = fg_kicker_player_name, yds_fg, fg_inds, fg_made, fg_make_prob, EPA, wpa, id_play)

