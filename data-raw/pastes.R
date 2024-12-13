# `pastes` data import

pastes <- readr::read_delim(
  file = fs::path("data-raw/data-files", "pastes", ext = "dat"),
  delim = "\t",
  show_col_types = FALSE,
  col_names = FALSE
)
colnames(pastes) <- c(
  "batch",
  paste0(rep(paste0("cask_", 1:3), each = 2), c("_1", "_2"))
)
pastes <- pastes |>
  tidyr::pivot_longer(
    cols = - batch,
    names_to = c("cask", "sample"),
    names_pattern = "^cask_(\\d)_(\\d)$",
    values_to = "strength"
  ) |>
  mutate(across(c(batch, cask, sample), as.factor)) |>
  labelled::set_variable_labels(
    batch = "Batch",
    cask = "Cask",
    sample = "Sample",
    strength = "Percentage paste strength"
  )


usethis::use_data(pastes, overwrite = TRUE)
