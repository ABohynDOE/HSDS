library(hsds)
library(ggplot2)

# Plot of the cumulative number of failures over time
ggplot(software, aes(x = time, y = event)) +
  geom_step() +
  geom_point(size = 1, shape = 16) +
  theme_classic() +
  ggeasy::easy_labs()

# The cumulative number of events at time t since testing initiation is given by
# N(t) = λt^β
# It can be rewritten as
# log(N(t)) = log(λ) + βlog(t)
# which is a linear model
mod <- lm(log(event) ~ log(time), data = software)
summary(mod)

# Plot the transformed data along with the linear regression
ggplot(software, aes(x = time, y = event)) +
  geom_point() +
  geom_smooth(method = "lm", formula = 'y ~ x') +
  scale_x_log10() +
  scale_y_log10() +
  labs(x = "log(Time to failure)", y = "log(Cumulative number of failures)") +
  theme_classic()

# The fitted logarithmic model can also be plotted against the original data
coefs <- unname(mod$coefficients)
coefs[1] <- exp(coefs[1])
ggplot(software, aes(x = time, y = event)) +
  geom_step() +
  geom_point() +
  geom_function(fun = ~ coefs[1] * .x ^ coefs[2], colour = "red") +
  theme_classic() +
  ggeasy::easy_labs()
