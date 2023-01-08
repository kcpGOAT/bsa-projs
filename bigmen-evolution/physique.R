library(tidyverse)
library(ggthemes)
library(data.table)

player_phys_base <- fread("https://raw.githubusercontent.com/WRNwilson/Exploratory-Data-Analysis-of-NBA-Player-Data/master/player_data.csv")
player_phys <- player_phys_base[, .(year = year_start:year_end), by = .(name, position, height, weight)][]

bigman_phys <- player_phys %>%
  separate(height, c("feet", "inches"), sep = "-")
bigman_phys$feet <- as.numeric(bigman_phys$feet)
bigman_phys$inches <- as.numeric(bigman_phys$inches)
bigman_phys$height <- 12 * bigman_phys$feet + bigman_phys$inches
bigman_phys <- bigman_phys %>%
  select(name, year, height, colnames(bigman_phys))

bigman_phys <- bigman_phys %>%
  filter(position %in% c("F-C", "C", "C-F")) %>%
  group_by(year) %>%
  summarize(height = round(mean(height), 1), weight = round(mean(weight), 1)) 

bigman_phys[73, ] <- list(2019, 83.1, 243)
bigman_phys[74, ] <- list(2020, 82.8, 241)



## Graphing height
ggplot(bigman_phys[bigman_phys$year >= 2010, ], aes(year, height)) +
  geom_point() + 
  geom_line() +
  labs(x = "Year", 
       y = "Height (inches)", 
       title = "Average height of big men in the NBA: 2010-2020") +
  theme_stata() +
  scale_x_continuous(breaks = seq(2010, 2020, 2)) +
  ylim(75, 85) +
  theme(axis.title.y = element_text(vjust = 3, face = "bold"),
        axis.title.x = element_text(face = "bold"),
        axis.text.y = element_text(hjust = 0.65), 
        title = element_text(face = "bold"))

## Graphing weight
ggplot(bigman_phys[bigman_phys$year >= 2010, ], aes(year, weight)) +
  geom_point() + 
  geom_line() +
  labs(x = "Year", 
       y = "Weight (lb)", 
       title = "Average weight of big men in the NBA: 2010-2020") +
  theme_stata() +
  scale_x_continuous(breaks = seq(2010, 2020, 2)) +
  ylim(230, 260) +
  theme(axis.title.y = element_text(vjust = 3, face = "bold"),
        axis.title.x = element_text(face = "bold"), 
        axis.text.y = element_text(hjust = 0.5), 
        title = element_text(face = "bold"))
