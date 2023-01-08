library(tidyverse)

average_raptor_war <- nba_data_historical %>%
  filter(year_id >= 1976, G >= 10) %>%
  group_by(name_common) %>%
  summarize(avg_raptor = mean(`Raptor WAR`))

hist(average_raptor_war$avg_raptor, 
     prob = TRUE, 
     col = "red", 
     density = 50, 
     xlim = c(-5, 15), 
     xlab = "Average Raptor WAR", 
     main = "")
hist(first_pick_perf$avg_raptor, 
     prob = TRUE, 
     col = "blue",
     density = 50, 
     breaks = 14,
     add = TRUE)
legend("topright", 
       c("NBA players", "1st overall picks"),
       density = c(50, 50), 
       fill = c("red", "blue"))

t.test(average_raptor_war$avg_raptor, first_pick_perf$avg_raptor)

# 	Welch Two Sample t-test

# data:  average_raptor_war$avg_raptor and first_pick_perf$avg_raptor
# t = -6.2504, df = 42.372, p-value = 1.674e-07
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -3.807252 -1.949143
# sample estimates:
#   mean of x mean of y 
# 0.8250581 3.7032558
