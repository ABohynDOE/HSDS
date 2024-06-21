# CEMENT
library(tidyr)
library(dplyr)

cement <- readr::read_delim(
  file = here::here("data-raw", "data-files", "cement.dat"),
  col_names = c("time", paste0("strength", 1:5)),
  col_types = "n"
) %>%
  pivot_longer(
    cols = contains("strength"),
    names_to = NULL,
    values_to = "strength"
  ) %>%
  filter(!is.na(strength)) %>%
  labelled::set_variable_labels(
    time = "Curing time (days)",
    strength = "Tensile strength (kg/cm2)"
  )

usethis::use_data(cement, overwrite = TRUE)
