# DISHWASH - data raw
library(tidyverse)

dishwash <- readr::read_delim(
  file = here::here("data-raw", "data-files", "dishwash.dat"),
  col_types = c("i", rep("c", 9)),
  col_names = c("block", paste0("detergent_", 1:9)),
  delim = "\t"
) %>%
  pivot_longer(
    cols = starts_with("detergent"),
    names_to = "detergent",
    names_prefix = "detergent_",
    values_to = "plates"
  ) %>%
  mutate(
    plates = str_remove_all(plates, "�") %>% as.numeric(),
    block = as_factor(block),
    detergent = as_factor(detergent),
  ) %>%
  filter(!is.na(plates)) %>%
  labelled::set_variable_labels(
    block = "Washing session",
    detergent = "Detergent brand",
    plates = "Number of plates washed"
  )

usethis::use_data(dishwash, overwrite = TRUE)
