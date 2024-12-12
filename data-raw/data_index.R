library(dplyr, warn.conflicts = F)
library(stringr)

# Read in the data index file
raw_data_index <- readr::read_delim(
  file = here::here("data-raw/raw_data_index.csv"),
  delim = ";",
  show_col_types = FALSE,
  col_names = TRUE
)

# List the processed files
processed_files <- fs::dir_ls(here::here("data")) |>
  fs::path_file() |>
  fs::path_ext_remove()

# Filter only the processed files in the data index
data_index_base <- raw_data_index |>
  dplyr::mutate(name = stringr::str_remove(file_name, ".DAT") |>
           stringr::str_to_lower()) |>
  dplyr::filter(name %in% processed_files) |>
  dplyr::select(name, description)

# Function to find the size of the a processed data set and the type of all the
# columns in the data set
compute_info <- function(filename) {
  load(here::here("data", paste0(filename, ".rda")))
  data <- get(ls()[ls() == filename])
  col_counts <- purrr::map_chr(colnames(data), ~class(data[[.x]])) |>
    table()
  col_types <- stringr::str_glue("{names(col_counts)} ({unname(col_counts)})") |>
    stringr::str_c(collapse = ", ")
  dim_data <- dim(data)
  list(
    "size" = sprintf("%i × %i", dim_data[1], dim_data[2]),
    "col_types" = col_types
  )
}

# Update the data index with the data size and the column types
data_index <- data_index_base |>
  dplyr::mutate(
    info = purrr::map(name, compute_info),
    size = purrr::map(info, ~.x$size),
    col_types = purrr::map(info, ~.x$col_types)
  ) |>
  tidyr::unnest(cols = c(size, col_types)) |>
  dplyr::select(name, description, size, col_types)

# Save the raw data index and the current data index to the same internal data
# file
usethis::use_data(raw_data_index, data_index, overwrite = TRUE, internal = TRUE)
