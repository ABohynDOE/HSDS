library(ggplot2)
library(hsds)

# There is a clear non-linear relation between time and strength
# Hald regresses log tensile strength on the reciprocal of curing time.

ggplot(cement, aes(y = strength, x = time)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ exp(1/x), se = FALSE) +
  theme_classic(base_size = 12)

# Using Hald's method the relationship is clearly linear
ggplot(cement, aes(y = log(strength), x = 1/time)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE) +
  theme_classic(base_size = 12)

# A linear model indeed fits well (high R-squared) and
# the reciprocal of time is significant
lm(log(strength) ~ I(1/time), data = cement) |>
  summary()
