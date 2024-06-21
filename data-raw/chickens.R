# CHICKENS
library(tidyr)

chickens <- readr::read_delim(
  file = here::here("data-raw", "data-files", "chickens.dat"),
  col_types = c("i", rep("n", 3)),
  col_names = c("block", "control", "low", "high")
) %>%
  pivot_longer(
    cols = -block,
    names_to = "dose",
    values_to = "weight"
  ) %>%
  dplyr::mutate(
    dose = factor(dose, levels = c("control", "low", "high")),
    block = as.factor(block)
  ) %>%
  labelled::set_variable_labels(
    block = "Birdhouse group",
    dose = "Drug dose",
    weight = "Average Weight (lbs) at maturity"
  )

usethis::use_data(chickens, overwrite = TRUE)
