library(tidyverse)
library(ggthemes)

ggplot(data = shaq_perf, aes(season, ppg)) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = 2002) +
  theme_stata() +
  labs(x = "Season", 
       y = "PPG", 
       title = "Shaq's Career Points Per Game", 
       caption = "Source: Basketball Reference") +
  ylim(0, 40) +
  theme(axis.title.y = element_text(vjust = 0.9), 
        plot.title = element_text(face = "bold"))

ggplot(data = shaq_perf, aes(season, fga)) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = 2002) +
  theme_stata() +
  labs(x = "Season", 
       y = "FGA", 
       title = "Shaq's Career Field Goal Attempts Per Game", 
       caption = "Source: Basketball Reference") +
  ylim(0, 30) +
  theme(axis.title.y = element_text(vjust = 0.9), 
        plot.title = element_text(face = "bold"))

ggplot(data = shaq_perf, aes(season, efg)) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = 2002) +
  theme_stata() +
  labs(x = "Season", 
       y = "eFG%", 
       title = "Shaq's Career Effective Field Goal Percentage", 
       caption = "Source: Basketball Reference") +
  ylim(0.5, 0.7) +
  theme(axis.title.y = element_text(vjust = 2), 
        plot.title = element_text(face = "bold"))

ggplot(data = shaq_perf, aes(season, mpg)) + 
  geom_point() + 
  geom_line() + 
  geom_vline(xintercept = 2002) +
  theme_stata() + 
  labs(x = "Season", 
       y = "MPG", 
       title = "Shaq's Career Minutes Per Game", 
       caption = "Source: Basketball Reference") +
  ylim(10, 50) +
  theme(axis.title.y = element_text(vjust = 0.8), 
        plot.title = element_text(face = "bold"))
