library(tidyverse)
library(ggthemes)

# Result: no noticeable change
bigman_rpg <- player_totals %>%
  filter(pos %in% c("PF", "C")) %>%
  group_by(season) %>%
  summarize(rpg = sum(trb)/sum(g))

ggplot(bigman_rpg[bigman_rpg$season >= 2010, ], aes(season, rpg)) +
  geom_point() + 
  geom_line() + 
  theme_stata() +
  labs(x = "Year",
       y = "RPG", 
       title = "Rebounds per game among big men in the NBA: 2010-2022") +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  ylim(5.0, 6.5)
