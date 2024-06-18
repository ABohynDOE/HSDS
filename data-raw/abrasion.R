# ABRASION
abrasion <- readr::read_delim(
  file = here::here("data-raw", "data-files", "abrasion.dat"),
  col_types = rep("n", 3),
  col_names = c("abrasion_loss", "hardness", "tensile_strength")
) %>%
  labelled::set_variable_labels(
    abrasion_loss = "Abrasion loss (g/h)",
    hardness = "Hardness (degree S)",
    tensile_strength = "Tensile Strength (kg/cm²)",
  )

usethis::use_data(abrasion, overwrite = TRUE)
