#' This script loads the data-index file located in
#' 'inst/extdata/data-index.csv' and generate the `current_data_index` which
#' contains only the data sets already imported in the package.
#'
#' In the long run, this script will be deleted, and only the "full" data index
#' will be preserved as a data file.
#'
#' The `current_data_index` file is also used by the `find_data()` function.

library(dplyr, warn.conflicts = F)
library(stringr)

# Load the data index
data_index <- readr::read_csv(
  file = here::here("inst", "extdata", "data-index.csv"),
  show_col_types = FALSE
)

# Function to load the data
load_data <- function(filename){
  load(here::here("data", paste0(filename, ".rda")))
  get(ls()[ls() == filename])
}

# Function to define the structure of a data set
data_structure <- function(data){
  columns <- sapply(colnames(data), function(x) class(data[[x]])) %>%
    table()
  structure <- paste(glue::glue("{names(columns)}({columns})"), collapse = ", ")
  structure
}

# Function to retrieve the size of a data set
data_size <- function(data){
  dims <- dim(data)
  sprintf("%i × %i", dims[1], dims[2])
}

# Select only the currently available data sets
current_data_index <- data_index %>%
  mutate(
    present = fs::file_exists(here::here("data", paste0(filename, ".rda")))
  ) %>%
  filter(present == TRUE) %>%
  mutate(
    data = purrr::map(filename, load_data),
    structure = purrr::map_chr(data, data_structure),
    size = purrr::map_chr(data, data_size),
  ) %>%
  select(-data) %>%
  tidyr::unnest(c(structure, size))

usethis::use_data(data_index, current_data_index, overwrite = TRUE,
                  internal = TRUE)
