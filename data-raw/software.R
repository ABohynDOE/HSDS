# SOFTWARE - data raw
library(tidyr)

software <- readr::read_delim(
  file = here::here("data-raw", "data-files", "software.dat"),
  col_types = rep("n", 6),
  col_names = FALSE
) %>%
  tidyr::pivot_longer(
    cols = everything(),
    names_to = NULL,
    values_to = "time"
  ) %>%
  dplyr::filter(!is.na(time)) %>%
  dplyr::arrange(time) %>%
  dplyr::mutate(i = 1, event = cumsum(i)) %>%
  dplyr::select(-i) %>%
  labelled::set_variable_labels(
    time = "Time to failure (CPU seconds)",
    event = "Cumulative number of failures"
  )

usethis::use_data(software, overwrite = TRUE)
