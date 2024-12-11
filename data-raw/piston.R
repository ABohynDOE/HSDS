# PISTON - data raw
library(dplyr)

piston <- readr::read_delim(
  file = here::here("data-raw", "data-files", "piston.dat"),
  col_types = "iii_",
  delim = "\t",
  col_names = FALSE
)
piston <- piston[1:4,]
colnames(piston) <- c("North", "Center", "South")
piston$compressor_no <- c(1, 2, 3, 4)
piston <- piston |>
  tidyr::pivot_longer(
    cols = -compressor_no,
    names_to = "leg",
    values_to = "n_failures"
  ) |>
  select(compressor_no, leg, n_failures) |>
  labelled::set_variable_labels(
    compressor_no = "Compressor number",
    leg = "Compressor leg",
    n_failures = "Number of failures"
  )

usethis::use_data(piston, overwrite = TRUE)
