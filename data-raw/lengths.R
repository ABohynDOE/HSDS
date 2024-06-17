library(dplyr)

lengths <- readr::read_delim(
  file = here::here("data-raw", "data-files", "lengths.dat"),
  delim = '\t',
  col_names = FALSE,
  col_types = 'i'
) %>%
  mutate(
    # Length units
    unit = ifelse(row_number() <= 3, "metres", "feet")
  ) %>%
  # Stack all values
  tidyr::pivot_longer(
    cols = -unit,
    names_to = NULL,
    values_to = "guessed_length"
  ) %>%
  # Remove empty guesses
  filter(!is.na(guessed_length)) %>%
  # Add true length
  mutate(
    true_length = ifelse(unit == "metres", 13.1, 43)
  )

usethis::use_data(lengths, overwrite = TRUE)
