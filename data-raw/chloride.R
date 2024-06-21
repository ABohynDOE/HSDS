# CHLORIDE - data raw
library(dplyr)
library(stringr)
library(tidyr)

chloride <- readr::read_delim(
  file = here::here("data-raw", "data-files", "chloride.dat"),
  col_types = rep("c", 8),
  col_names = FALSE,
  delim = "\t"
) %>%
  filter(row_number() > 1) %>%
  mutate(
    across(everything(), ~ str_remove_all(.x, "�")),
    block = 1:4
  ) %>%
  pivot_longer(
    cols = -block,
    names_to = NULL,
    values_to = "yield",
    values_transform = as.numeric
  ) %>%
  mutate(
    unit = rep(c(rep(1, 4), rep(2, 4)), 4),
    amount = rep(c("low", "low", "high", "high"), 8),
    quality = rep(c("low", "high"), 16),
    across(c(amount, quality), ~ factor(.x, levels = c("low", "high"))),
    across(c(block, unit), as.factor)
  ) %>%
  labelled::set_variable_labels(
    unit = "Production unit",
    block = "Block",
    quality = "Ammonium chloride quality",
    amount = "Ammonium chloride amount",
    yield = "Yield (pounds)"
  )


usethis::use_data(chloride, overwrite = TRUE)
