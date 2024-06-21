library(hsds)
library(ggplot2)

# Two-way interaction plot between amount and quality
chloride %>%
  dplyr::filter(!is.na(yield)) %>%
  ggplot(aes(x = amount, y = yield, color = quality, group = quality)) +
  geom_point() +
  geom_line() +
  facet_wrap(
    .~block,
    nrow = 2,
    labeller = labeller(.rows = ~paste0("Block ", .x))
  ) +
  theme_classic()
