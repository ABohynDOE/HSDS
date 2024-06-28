# PISTON - data raw
library(dplyr, warn.conflicts = FALSE)
library(forcats)

piston <- readr::read_delim(
  file = here::here("data-raw", "data-files", "piston.dat"),
  col_types = "n",
  col_names = c("North", "Center", "South", "Total")
) %>%
  mutate(compressor = c(1:4, NA), .before = 1) %>%
  select(-Total) %>%
  filter(!is.na(compressor)) %>%
  tidyr::pivot_longer(
    cols = -compressor,
    names_to = "leg",
    values_to = "failures"
  ) %>%
  mutate(
    compressor = as_factor(compressor),
    leg = as_factor(leg),
  ) %>%
  labelled::set_variable_labels(
    compressor = "Compressor ID",
    leg = "Compressor leg",
    failures = "Number of failures",
  )


usethis::use_data(piston, overwrite = TRUE)
