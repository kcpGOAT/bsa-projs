library(tidyverse)
library(ggthemes)

# Note: APG and usage rates are not a completely accurate measure of 
# playmaking, so it may be prudent to take these findings with a grain
# of salt
bigman_assists <- player_totals %>%
  filter(pos %in% c("PF", "C")) %>%
  group_by(season) %>%
  summarize(apg = sum(ast)/sum(g))

ggplot(data = bigman_assists[bigman_assists$season >= 2010, ], 
       aes(season, apg)) +
  geom_point() +
  geom_line() +
  theme_stata() +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  labs(x = "Year", 
       y = "APG", 
       title = "Assists per game among big men: 2010-2022")

bigman_usage <- advanced_stats %>%
  filter(pos %in% c("PF", "C")) %>%
  group_by(season) %>%
  summarize(usage = mean(usg_percent))

ggplot(data = bigman_usage[bigman_usage$season >= 2010, ], 
       aes(season, usage)) +
  geom_point() +
  geom_line() +
  theme_stata() +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  labs(x = "Year", 
       y = "USG%", 
       title = "Usage rate among big men: 2010-2022")

# Overall, the average big man is not much more of a playmaker. However, 
# there are a few exceptions to this rule, such as Nikola Jokic. 
