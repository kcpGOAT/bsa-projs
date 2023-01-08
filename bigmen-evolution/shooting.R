library(tidyverse)
library(ggthemes)

## PROPORTION OF SHOTS THAT ARE TWO-POINTERS
bigman_prop_2pt <- player_totals %>%
  filter(pos %in% c("PF", "C"), season >= 2008) %>%
  group_by(season) %>%
  summarize(prop_2pt = sum(x2pa)/(sum(x2pa) + sum(x3pa)))

ggplot(bigman_prop_2pt, aes(season, prop_2pt)) + 
  geom_point() + 
  geom_line() + 
  theme_stata() +
  ylim(0.40, 1.00) +
  scale_x_continuous(breaks = seq(2008, 2022, 2)) +
  labs(x = "Season", y = "Two-point attempts / total attempts", 
       title = "Average 2PT frequency among big men in the NBA: 2010-2022") +
  theme(axis.title.x = element_text(vjust = 0.5), 
        axis.title.y = element_text(vjust = 3), 
        axis.title = element_text(face = "bold"),
        axis.text.y = element_text(hjust = 0.6)) 

## 3PT SHOOTING
bigman_3pt <- player_totals %>%
  filter(pos %in% c("PF", "C")) %>%
  group_by(season) %>%
  summarize(mean_3pt = sum(x3p)/sum(x3pa), 
            mean_3pv = sum(x3pa))

# No significant increase
ggplot(bigman_3pt[bigman_3pt$season >= 2010, ], aes(season, mean_3pt)) + 
  geom_point() +
  geom_line() +
  theme_stata() +
  labs(x = "Year", 
       y = "Mean 3PT%", 
       title = "Three-point efficiency among big men in the NBA: 2010-2022") +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  ylim(0.30, 0.38) +
  theme(axis.title.x = element_text(vjust = 0.5), 
        axis.title.y = element_text(vjust = 3), 
        axis.title = element_text(face = "bold"), 
        axis.text.y = element_text(hjust = 0.6)) 

# Very significant increase
ggplot(bigman_3pt[bigman_3pt$season >= 2010, ], aes(season, mean_3pv)) + 
  geom_point() +
  geom_line() +
  theme_stata() +
  labs(x = "Year", 
       y = "Number of three-point attempts", 
       title = "Three-point volume among big men in the NBA: 2010-2022") +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  theme(axis.title.x = element_text(vjust = 0.5), 
        axis.title.y = element_text(vjust = 3), 
        axis.title = element_text(face = "bold"), 
        axis.text.y = element_text(hjust = 0.6)) 


## FREE THROW SHOOTING
bigman_ft <- player_totals %>%
  filter(pos %in% c("PF", "C")) %>%
  group_by(season) %>%
  summarize(mean_ft = sum(ft)/sum(fta))

# 2010 - 2022: misleading increase considering small absolute difference
# and the fact that improvement over the years hasn't been that much
ggplot(data = bigman_ft[bigman_ft$season >= 2010, ], aes(season, mean_ft)) +
  geom_point() +
  geom_line() + 
  theme_stata() +
  labs(x = "Year", 
       y = "Mean free throw percentage", 
       title = "Free throw efficiency among big men in the NBA: 2010-2022") +
  scale_x_continuous(breaks = seq(2010, 2022, 2)) +
  theme(axis.title.x = element_text(vjust = 0.5), 
        axis.title.y = element_text(vjust = 3), 
        axis.title = element_text(face = "bold"), 
        axis.text.y = element_text(hjust = 0.6)) 

# 1977 - 2022
ggplot(data = bigman_ft[bigman_ft$season >= 1977, ], aes(season, mean_ft)) +
  geom_point() +
  geom_line() + 
  theme_stata() +
  labs(x = "Year", 
       y = "Mean free throw percentage", 
       title = "Free throw efficiency among big men in the NBA: 1977-2022") +
  theme(axis.title.x = element_text(vjust = 0.5), 
        axis.title.y = element_text(vjust = 3), 
        axis.title = element_text(face = "bold"), 
        axis.text = element_text(hjust = 2), 
        axis.text.y = element_text(hjust = 0.6), 
        axis.text.x = element_text(hjust = 0.5)) 
