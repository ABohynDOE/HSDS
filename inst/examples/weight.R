library(hsds)
library(dplyr)
library(ggplot2)

# Mean weight gain per diet
weight %>%
  summarise(
    mean(weight),
    sd(weight),
    .by = c(source, amount)
  )

# Colored box plot
ggplot(weight, aes(x = amount, y = weight, color = source)) +
  geom_boxplot() +
  geom_jitter(position = position_dodge(width = 0.75)) +
  theme_classic()

# Two-way ANOVA
aov(weight ~ amount * source, data = weight) %>%
  summary()
