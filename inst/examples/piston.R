library(ggplot2)
library(hsds)

# Plot of the number of failures per leg, per compressor
ggplot(piston, aes(x = leg, y = failures)) +
  geom_boxplot() +
  geom_point(aes(color = compressor), size = 2) +
  theme_classic(12) +
  ggeasy::easy_labs()

# Questions of interest:
#   - Does the probability of failure vary between compressors or between
#     different legs?
#   - Is the pattern of the location of failures is different for different
#     compressors?

# Davies and Goldsmith investigate these questions using chi-squared tests
tab <- xtabs(failures ~ compressor + leg, data = piston)
chisq.test(tab)
