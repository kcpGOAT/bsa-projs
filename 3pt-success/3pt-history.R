library(tidyverse)
library(ggthemes)
history_3pt <- nba_data_historical %>%
  filter(G > 10, year_id > 1979) %>%
  group_by(year_id) %>%
  summarize(share_3pt = mean(share_3pt, na.rm = TRUE))

ggplot(history_3pt, aes(year_id, share_3pt)) +
  geom_line() +
  labs(x = "Year", 
       y = "Proportion of shots from three-point range",
       title = "The growth of three-point shooting in the NBA",
       caption = "Source: FiveThirtyEight") +
  theme_stata() +
  theme(panel.grid.major = element_blank(), 
        plot.title = element_text(hjust = 0.5), 
        plot.caption = element_text(hjust = -0.05),
        axis.title.y = element_text(vjust = 2),
        axis.title.x = element_text(vjust = -0.5),
        axis.text.y = element_text(hjust = 0.5))

######

hist_3pa <- Seasons_Stats %>%
  filter(Year > 1979, G > 10) %>%
  group_by(Tm, Year) %>%
  summarize(threept_attempts = sum(`3PA`)/82) %>%
  group_by(Year) %>%
  summarize(threept_attempts = mean(threept_attempts))

ggplot(hist_3pa, aes(Year, threept_attempts)) +
  geom_line() +
  labs(y = "Average team three-point attempts", 
       title = "The increase in the number of three-point shots per game", 
       caption = "Source: Kaggle") +
  theme_stata() +
  xlim(1980, 2020) +
  ylim(0, 30) +
  theme(panel.grid.major = element_blank(), 
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = -0.05),
        axis.title.y = element_text(vjust = 2),
        axis.title.x = element_text(vjust = -0.5),
        axis.text.y = element_text(hjust = 0.5))

#####

hist_efficiency <- Seasons_Stats %>%
  filter(Year >= 1980) %>%
  group_by(Year) %>%
  summarize(three_fg = sum(`3P`)/sum(`3PA`))
  
ggplot(hist_efficiency, aes(Year, three_fg)) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = 1996) +
  theme_stata() +
  labs(y = "3FG%", 
       title = "NBA three-point efficiency: 1980-2017", 
       caption = "Source: Kaggle") +
  theme(panel.grid.major = element_blank(), 
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = -0.05),
        axis.title.y = element_text(vjust = 2),
        axis.title.x = element_text(vjust = -0.5),
        axis.text.y = element_text(hjust = 0.5))
