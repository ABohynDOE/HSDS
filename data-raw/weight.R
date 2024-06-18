# WEIGHT
library(dplyr)

weight <- readr::read_delim(
  file = here::here("data-raw", "data-files", "weight.dat"),
  col_names = c("beef_low", "beef_high", "cereal_low", "cereal_high"),
  col_types = "i"
) %>%
  tidyr::pivot_longer(
    cols = everything(),
    names_to = c("source", "amount"),
    names_pattern = "(\\w+)_(\\w+)",
    values_to = "weight"
  ) %>%
  mutate(
    source = as.factor(source),
    amount = factor(amount, levels = c("low", "high"))
  ) %>%
  labelled::set_variable_labels(
    weight = "Weight gain",
    source = "Protein source",
    amount = "Protein amount"
  )
usethis::use_data(weight, overwrite = TRUE)
