# FLICKER - data raw
library(dplyr)
library(tidyr)

flicker <- readr::read_delim(
  file = here::here("data-raw", "data-files", "flicker.dat"),
  col_names = c("subject", "day_1", "day_2", "day_3"),
  col_types = c("i", rep("c", 3))
) %>%
  pivot_longer(
    cols = starts_with("day"),
    names_to = "day",
    names_prefix = "day_",
    values_to = "frequency"
  ) %>%
  separate_wider_regex(
    cols = "frequency",
    patterns = c(
      frequency = "\\d\\d\\.\\d\\d",
      "\\s\\(",
      treatment = "\\w",
      "\\)"
    )
  ) %>%
  mutate(
    subject = as.factor(subject),
    day = as.factor(as.numeric(day)),
    frequency = as.numeric(frequency),
    treatment = factor(
      treatment,
      levels = c("A", "B", "C"),
      labels = c("meclastine", "placebo", "promethazine")
    )
  ) %>%
  labelled::set_variable_labels(
    subject = "Subject",
    day = "Day",
    frequency = "Flicker frequency",
    treatment = "Treatment"
  )

usethis::use_data(flicker, overwrite = TRUE)
