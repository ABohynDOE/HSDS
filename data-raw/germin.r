library(stringr)
library(dplyr)
library(forcats)

germin <- readr::read_delim(
  file = fs::path("data-raw/data-files", "germin", ext = "dat"),
  col_names = paste0("water_", 1:6),
  col_types = rep("i", 6)
) |>
  mutate(
    # Turn missing value into NA
    water_5 = water_5 %>% str_remove_all("\\*") %>% as.numeric(),
    # Add covering info
    box = ifelse(row_number() <= 4, "Covered", "Uncovered") %>%
      as_factor()
  ) %>%
  # One column per variable (tidy data format)
  tidyr::pivot_longer(
    cols = -box,
    names_to = "water",
    names_prefix = "water_",
    values_to = "seeds",
    names_transform = as_factor
  ) %>%
  # Add variable labels
  labelled::set_variable_labels(
    water = "Water level",
    seeds = "Number of germinated seeds",
    box = "Box covering"
  )

usethis::use_data(germin, overwrite = TRUE)
