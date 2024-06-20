library(ggplot2)
library(patchwork)
library(hsds)

# Plot variation within days, treatments and subjects
## Days
p_days <- ggplot(flicker, aes(x = day, y = frequency)) +
  geom_boxplot(color = "gray") +
  geom_jitter(width = 0.1) +
  theme_classic()
## Treatments
p_treat <- ggplot(flicker, aes(x = treatment, y = frequency)) +
  geom_boxplot(color = "gray") +
  geom_jitter(width = 0.1) +
  theme_classic()
## Subjects
p_subj <- ggplot(flicker, aes(x = subject, y = frequency)) +
  geom_boxplot(color = "gray") +
  geom_jitter(width = 0.1) +
  theme_classic()
# Combine using the `patchwork` package
p_days + p_treat + p_subj + plot_layout(nrow = 2)

# Mixed model with random effects for day and subject
mod <- lmer(frequency ~ treatment + (1 |subject) + (1 | day), data = flicker)

# Plot of the marginal means per treatment, using the `modelbased` package
modelbased::estimate_means(mod, at = c("treatment")) |>
  plot() +
  theme_classic()

# Table of the contrast between treatments, using the `modelbased` package
modelbased::estimate_contrasts(mod, contrast = "treatment")
