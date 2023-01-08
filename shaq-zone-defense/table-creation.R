library(tidyverse)
library(rvest)

shaq_stats <- read_html("https://www.basketball-reference.com/players/o/onealsh01.html")
 
season <- shaq_stats %>% 
  html_elements("#per_game .full_table th , .sorttable_sorted") %>%
  html_text()
season <- sapply(season, function(x) {
  as.numeric(substr(x, 1, 4)) + 1
})
season <- unname(season)

age <- season - (1992 - 20)

mpg <- shaq_stats %>%
  html_elements("#per_game .full_table .right:nth-child(8)") %>%
  html_text()
mpg <- as.numeric(mpg)

ppg <- shaq_stats %>%
  html_elements("#per_game .full_table .right:nth-child(30)") %>%
  html_text()
ppg <- as.numeric(ppg)

fga <- shaq_stats %>%
  html_elements("#per_game .full_table .right:nth-child(10)") %>%
  html_text()
fga <- as.numeric(fga)

efg <- shaq_stats %>%
  html_elements("#per_game .full_table .right:nth-child(18)") %>%
  html_text()
efg <- as.numeric(efg)

shaq_perf <- cbind(season, age, mpg, ppg, fga, efg)
shaq_perf <- as.data.frame(shaq_perf)
