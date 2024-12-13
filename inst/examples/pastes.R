library(lme4)

# The cask numbers are not uniquely defined across batches
xtabs(~ batch + cask, pastes)

# This can lead to a "crossed" random effect design if the model terms are
# not correctly specified
m1 <- lmer(strength ~ (1 | batch) + (1 | cask), data = pastes)
summary(m1)
# The model identifies 3 different casks used repeatedly over the 10 batches (WRONG)
summary(m1)$ngrps

# Specifying the random effect structure avoids this issue, and correctly leads
# to a "nested" random effect structure
m2 <- lmer(strength ~ (1 | batch / cask), data = pastes)
summary(m2)
# There are indeed 30 combinations of casks and batches (3 *different* casks used
# in each batch)
summary(m2)$ngrps
