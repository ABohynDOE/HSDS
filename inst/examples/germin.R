library(ggplot2)

ggplot(germin, aes(x = water, y = seeds, fill = box)) +
  geom_boxplot(na.rm = TRUE) +
  theme_bw()
