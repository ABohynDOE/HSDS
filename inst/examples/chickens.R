library(hsds)
library(ggplot2)
library(lme4)

# Plot of the average weight per diet, on top of a box plot
ggplot(chickens, aes(x = dose, y = weight)) +
  geom_boxplot(color = "gray") +
  geom_line(aes(color = block, group = block)) +
  geom_point(aes(color = block), size = 2) +
  theme_classic()

# Model of the weight by dose, taking into account the random variation within
# each individual unit
mod <- lmer(weight ~ dose + (1 | block), data = chickens)
summary(mod)

# The `modelbased` package is great to estimate marginal means
modelbased::estimate_means(mod, at = c("dose"))

# Or to estimate contrasts to see if there is a significant difference in weight
# between diets
modelbased::estimate_contrasts(mod, contrast = "dose", p_adjust = "tukey")
