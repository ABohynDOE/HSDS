# TEARING
library(magrittr)

tearing <- readr::read_delim(
  file = here::here("data-raw", "data-files", "tearing.dat"),
  col_types = rep("n", 5),
  col_names = c("pressure", paste0("tear", 1:4))
) %>%
  tidyr::pivot_longer(
    cols = -pressure,
    names_to = NULL,
    values_to = "tear_factor"
  ) %>%
  labelled::set_variable_labels(
    pressure = "Pressure applied during pressing",
    tear_factor = "Tear factor"
  )

usethis::use_data(tearing, overwrite = TRUE)
