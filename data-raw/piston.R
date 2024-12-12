# `piston` data import

library(dplyr)

piston <- readr::read_delim(
  file = fs::path("data-raw/data-files", "piston", ext = "dat"),
  delim = "\t",
  show_col_types = FALSE,
  col_names = FALSE
)
piston <- piston[1:4, 1:3]
colnames(piston) <- c("North", "Center", "South")
piston$comp_id <- c(1:4)
piston <- piston |>
  tidyr::pivot_longer(
    cols = -comp_id,
    names_to = "leg",
    values_to = "n_failures"
  ) |>
  labelled::set_variable_labels(
    comp_id = "Compressor ID",
    leg = "Compressor leg",
    n_failures = "Number of failures"
  )

usethis::use_data(piston, overwrite = TRUE)
