library(dplyr)

# Standardize the difference between the guessed and true lengths to a mean 0
# and a std deviation of 1
lengths_std <- lengths |>
  mutate(
    length_diff = guessed_length - true_length,
    std_length_diff = (length_diff - mean(length_diff)) / sd(guessed_length),
    .by = unit
  )

# Plot the density for each unit, as well as the cumulative distribution
ggplot(lengths_std, aes(x = std_length_diff)) +
  geom_density(fill = "gray") +
  stat_ecdf() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  facet_grid(.~unit) +
  labs(x = "Std length difference", y = "(Cumulative) frequency") +
  theme_bw()
