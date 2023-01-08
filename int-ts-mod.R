library(stargazer)

shaq_perf$treatment <- ifelse(shaq_perf$season >= 2002, 1, 0)
shaq_perf$time <- shaq_perf$season - 1992
shaq_perf$time_since <- ifelse(shaq_perf$season >= 2002, shaq_perf$season - 2001, 0)

ts_mod <- function(x) {
  lm(x ~ time + treatment + time_since, shaq_perf)
}

summary_ts_mod <- function(x) {
  mod <- ts_mod(x)
  summary(mod)
}

summary_ts_mod(shaq_perf$ppg)

summary_ts_mod(shaq_perf$fga)

summary_ts_mod(shaq_perf$efg)

stargazer(ts_mod(shaq_perf$ppg), ts_mod(shaq_perf$fga), ts_mod(shaq_perf$efg),
          type = "html", 
          out = "mod_fit.html", 
          column.labels = c("PPG", "FGA", "eFG%"), 
          model.numbers = FALSE)

# Conclusion: Zone defense prevents Shaq from taking attempts, but if he were 
# able to reach the paint, his efficiency wouldn't be affected
