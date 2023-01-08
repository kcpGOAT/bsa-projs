library(tidyverse)
library(ggthemes)

# Limitation: efficiency metrics are generally *relative* to an average player, 
# so it is somewhat impossible to make a pure comparison between big men
# of different eras in this manner
bigman_vorp <- advanced_stats %>%
  filter(pos %in% c("PF", "C")) %>%
  group_by(season) %>%
  summarize(vorp = mean(vorp, na.rm = TRUE)) 

# 2010-2022
ggplot(data = bigman_vorp[bigman_vorp$season >= 2010, ], aes(season, vorp)) +
  geom_point() +
  geom_line() +
  theme_stata() +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  labs(x = "Year", 
       y = "VORP", 
       title = "VORP among big men in the NBA: 2010-2022")

# 1974-2022
ggplot(data = bigman_vorp[!is.na(bigman_vorp$vorp), ], aes(season, vorp)) +
  geom_point() +
  geom_line() +
  theme_stata() +
  scale_x_continuous(breaks = seq(1974, 2022, 6)) +
  labs(x = "Year", 
       y = "VORP", 
       title = "VORP among big men in the NBA: 1974-2022")
