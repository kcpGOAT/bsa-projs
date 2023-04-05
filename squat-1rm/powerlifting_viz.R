library(ggplot2)
library(ggthemes)

univar_plot <- function(df, var, ...) {
  # The purpose of this function is to create a univariate time series plot
  # with an in-built theme and design from ggplot2 and its associated packages.
  # Input #1: df - data frame or tibble with year variable
  # Input #2: var - target numeric variable **Must use dollar sign operator**
  # Allowed inputs: arguments for the labs() function
  # Output: Time series plot
  ggplot(data = df, mapping = aes(year, var)) +
    geom_point() +
    geom_line() +
    labs(x = "Year", ..., caption = "Source: Kaggle") +
    scale_x_continuous(breaks = seq(1965, 2015, by = 10)) +
    theme_stata() +
    theme(axis.title.x = element_text(vjust = -0.5), 
          axis.text.y = element_text(hjust = 0.5, vjust = 0.8),
          axis.title.y = element_text(vjust = 3),
          axis.title = element_text(face = "bold"))
}

# Overall statistic

univar_plot(df = max_squats,
            var = max_squats$best_squat,
            y = "Best squat (kg)", 
            title = "Average Best Squat for Powerlifters: 1964 to 2019")

# Ages over time

ggplot(data = age_history, mapping = aes(x = year)) +
  geom_point(mapping = aes(y = mean_age)) +
  geom_point(mapping = aes(y = median_age)) +
  geom_line(mapping = aes(y = mean_age, col = "Mean age")) +
  geom_line(mapping = aes(y = median_age, col = "Median age")) +
  labs(x = "Year", 
       y = "Age",
       title = "Mean and Median Age of Powerlifters: 1964 to 2019",
       caption = "Source: Kaggle") +
  scale_x_continuous(breaks = seq(1965, 2015, by = 10)) +
  scale_color_manual(name = NULL,
                     values = c("Mean age" = "red",
                                "Median age" = "blue")) +
  theme_stata() +
  theme(axis.title.x = element_text(vjust = -0.5), 
        axis.text.y = element_text(hjust = 0.5, vjust = 0.8),
        axis.title.y = element_text(vjust = 3),
        axis.title = element_text(face = "bold"))

# Gender distribution over time

ggplot(data = sex_history, mapping = aes(x = year)) +
  geom_point(mapping = aes(y = prop_male)) +
  geom_point(mapping = aes(y = prop_female)) +
  geom_line(mapping = aes(y = prop_female, col = "% Female")) +
  geom_line(mapping = aes(y = prop_male, col = "% Male")) +
  labs(x = "Year", 
       y = "",
       title = "Proportion of Powerlifters by Sex: 1964-2019") +
  scale_color_manual(name = NULL,
                     values = c("% Female" = "red",
                                "% Male" = "blue")) +
  scale_x_continuous(breaks = seq(1965, 2015, by = 10)) +
  theme_stata() + 
  theme(axis.title.x = element_text(vjust = -0.5), 
        axis.text.y = element_text(hjust = 0.5, vjust = 0.8),
        axis.title.y = element_text(vjust = 3),
        axis.title = element_text(face = "bold"))

# Number of lifters over time

univar_plot(df = num_lifters_diff,
            var = num_lifters_diff$count,
            y = "# of lifters", 
            title = "Number of Measured Powerlifters: 1964 to 2019")

univar_plot(df = num_lifters_diff,
            var = num_lifters_diff$change_count,
            y = "Change in # of lifters", 
            title = "Change in the Number of Powerlifters by Year: 1964 to 2019")

univar_plot(df = num_lifters_diff,
            var = num_lifters_diff$change_percent,
            y = "Percent change", 
            title = "Percent Change in the Number of Powerlifters by Year: 1964 to 2019")

# Bodyweights over time

ggplot(data = bw_history, aes(year)) +
  geom_point(aes(y = mean_bw_kg)) +
  geom_point(aes(y = median_bw_kg)) +
  geom_line(aes(y = mean_bw_kg, col = "Mean bodyweight (kg)")) +
  geom_line(aes(y = median_bw_kg, col = "Median bodyweight (kg)")) +
  labs(x = "Year", 
       y = "",
       title = "Mean and Median Bodyweight of Powerlifters: 1964-2019") +
  scale_color_manual(name = NULL,
                     values = c("Mean bodyweight (kg)" = "red",
                                "Median bodyweight (kg)" = "blue")) +
  scale_x_continuous(breaks = seq(1965, 2015, by = 10)) +
  ylim(74, 90) +
  theme_stata() + 
  theme(axis.title.x = element_text(vjust = -0.5), 
        axis.text.y = element_text(hjust = 0.5, vjust = 0.8),
        axis.title.y = element_text(vjust = 3),
        axis.title = element_text(face = "bold"))

# Final plots

adjusted_max <- na.omit(adjusted_max)

ggplot(data = adjusted_max, aes(year, best_squat)) +
  geom_point(aes(col = sex)) +
  geom_line(aes(col = sex)) +
  labs(x = "Year", y = "Best squat (kg)",
       title = "Adjusted Best Squat for Powerlifters: 1964-2019",
       col = NULL,
       caption = "Source: Kaggle") +
  scale_x_continuous(breaks = seq(1965, 2015, by = 10)) +
  theme_stata() +
  theme(axis.title.x = element_text(vjust = -0.5), 
        axis.text.y = element_text(hjust = 0.5, vjust = 0.8),
        axis.title.y = element_text(vjust = 3),
        axis.title = element_text(face = "bold")) 
  

univar_plot(df = highest_max, 
            var = highest_max$best_squat, 
            y = "Highest max squat (kg)",
            title = "Highest Max Squats for Powerlifters: 1964 to 2019")
