library(dplyr)

darwin <- readr::read_delim(
  file = here::here("data-raw", "data-files", "darwin.dat"),
  delim = "\t",
  col_names = c("pair", "cross", "self"),
  col_types = rep('i', 3)
) %>%
  tidyr::pivot_longer(
    cols = -pair,
    names_to = "fertilization",
    values_to = "height",
    names_transform = forcats::as_factor
  ) %>%
  labelled::set_variable_labels(
    pair = "Seedling pair",
    height = "Plant height (inches)",
    fertilization = "Fertilization type"
  )

usethis::use_data(darwin, overwrite = TRUE)
