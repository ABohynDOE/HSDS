library(dplyr, warn.conflicts = F)
library(stringr)

# Read in the data index text file
data_index_lines <- readLines(here::here("data-raw", "data_index.txt"))
match <- str_match(
  data_index_lines,
  "^(?<num>\\d+)\\.\\s(?<title>.+)\\s(?<rows>\\d+)\\s(?<cols>\\d+)\\s(?<columns>.+)\\s(?<filename>[A-Z]+)\\.DAT$"
)

# Turn it into a dataframe
data_index <- match[,2:ncol(match)] %>%
  as.data.frame() %>%
  mutate(
    filename = tolower(filename),
    num = as.numeric(num)
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
