# Data wrangling
season_stats <- season_stats_main

season_stats <- season_stats[season_stats$season %in% 1992:2011, ]

max_ages <- aggregate(Age ~ Player, season_stats, max)
max_ages <- as.data.frame(max_ages)
max_ages <- max_ages[max_ages$Age >= 35, ]

season_stats <- season_stats[season_stats$Player %in% max_ages$Player, ]

season_stats <- season_stats[!is.na(season_stats$season), ]
season_stats$PPG <- round(season_stats$PTS/season_stats$G, 2)
season_stats$FGA <- round(season_stats$FGA/season_stats$G, 2)
season_stats <- subset(season_stats, 
                       select = c("season", "Player", "Age", "PPG", "FGA", "eFG%"))

# Building models 

summary_quad_mod <- function(x) {
  mod <- lm(x ~ Age + I(Age^2), season_stats)
  summary(mod)
}

summary_quad_mod(season_stats$PPG)

summary_quad_mod(season_stats$FGA)

summary_quad_mod(season_stats$`eFG%`)

# Predictions

quad_pred_plot <- function(a, b, outcome = "") {
  c <- mean(b, na.rm = TRUE) - mean(a, na.rm = TRUE)
  mod <- lm(I(a + c) ~ Age + I(Age^2), season_stats)
  pred_mod <- predict(mod, list(Age = shaq_perf$age))
  plot(b ~ shaq_perf$age, 
       type = "b", 
       xlab = "Age",
       main = paste("Quadratic regression for ", outcome, ": predictions versus observations", 
                    sep = ""),
       ylab = outcome, 
       mgp = c(2.5, 1, 0))
  mtext(text = "Sources: Basketball Reference, Kaggle", 
        side = 1, 
        adj = -0.15, 
        padj = 7, 
        cex = 0.75)
  lines(pred_mod ~ shaq_perf$age, col = "red")
}

quad_pred_plot(season_stats$PPG, shaq_perf$ppg, "PPG")

quad_pred_plot(season_stats$FGA, shaq_perf$fga, "FGA")

quad_pred_plot(season_stats$`eFG%`, shaq_perf$efg, "eFG%")
