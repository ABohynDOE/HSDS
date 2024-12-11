# SOFTWARE - data raw
library(dplyr)

software <- readr::read_delim(
  file = here::here("data-raw", "data-files", "software.dat"),
  delim = "\t",
  col_names = FALSE,
  show_col_types = FALSE
) |>
  tidyr::pivot_longer(
    cols = everything(),
    names_to = NULL,
    values_to = "time"
  ) |>
  arrange(time) |>
  mutate(failure_id = seq_len(n())) |>
  filter(!is.na(time)) |>
  labelled::set_variable_labels(
    time = "Failure time (CPU seconds)",
    failure_id = "Failure number"
  )


usethis::use_data(software, overwrite = TRUE)
