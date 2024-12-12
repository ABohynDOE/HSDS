# `{{data}}` data import

library(dplyr)

{{data}} <- readr::read_delim(
  file = fs::path("data-raw/data-files", "{{data}}", ext = "dat"),
  delim = "\t",
  show_col_types = FALSE,
  col_names = FALSE
)

usethis::use_data({{data}}, overwrite = TRUE)
