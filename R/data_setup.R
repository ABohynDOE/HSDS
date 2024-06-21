#' Setup for a new data set
#'
#' Generate the three files needed for a new data set:
#' - A file to import the raw data as an R data set
#' - A file to generate the documentation of the data set
#' - A file to contain the examples for the data generated
#' and opens the file interactively if needed.
#'
#' @param data character. Name of the data set for which the files are created. Must be an existing `.dat` file in the `data-raw` folder.
#' @param open Whether to open the file for interactive editing.
#' @md
#' @keywords internal
data_setup <- function(data, open = rlang::is_interactive()) {
  # ARG CHECK ----
  if (!is.character(data)) {
    cli::cli_abort(
      c(
        "{.var data} must be a character",
        "x" = "You've supplied a {.cls {class(data)}}"
      )
    )
  }
  if (!fs::file_exists(here::here("data-raw", "data-files", paste0(data, ".dat")))) {
    cli::cli_abort(
      c(
        "{.var data} must be the name of an existing data file",
        "x" = "File {.file {paste0(data, '.dat')}} doesn't exist in {.path data-raw/data-files}"
      )
    )
  }
  # DATA GENERATION ----
  # Location of the file to convert the raw data
  data_raw_path <- here::here("data-raw", paste0(data, ".R"))
  if (fs::file_exists(data_raw_path)) {
    cli::cli_abort("File {.path {data_raw_path}} already exists, skipping !")
  } else {
    # Generate the empty file
    fs::file_create(data_raw_path)
    # Generic code to write to all files
    text <- c(
      glue::glue("# {toupper(data)} - data raw"),
      "library(dplyr)",
      "",
      glue::glue("{data} <- readr::read_delim("),
      glue::glue('  file = here::here("data-raw", "data-files", "{data}.dat"),'),
      ")",
      "",
      glue::glue("usethis::use_data({data}, overwrite = TRUE)")
    )
    # Write generic code to empty file
    writeLines(text, con = data_raw_path)
    # Info message to user
    cli::cli_alert_info("Data generation file for '{data}' created at: {.path {data_raw_path}}")
  }
  usethis::edit_file(data_raw_path, open = open)


  # DATA DOCUMENTATION ----
  # Name of the data documentation file
  data_doc_path <- here::here("R", paste0(data, ".R"))
  if (fs::file_exists(data_doc_path)) {
    cli::cli_abort("File {.path {data_doc_path}} already exists, skipping !")
  } else {
    # Generate the empty file
    fs::file_create(data_doc_path)
    # Generic code to write to documentation files
    text <- c(
      "#' ",
      "#' ",
      "#' ",
      "#' ",
      "#' @format A data frame with X rows and X columns:",
      "#' \\describe{",
      "#'   \\item{}{}",
      "#' }",
      "#' ",
      paste0("#' @example inst/examples/", data, ".R"),
      "#' ",
      "#' @source {}",
      paste0('"', data, '"')
    )
    # Write text to raw data file
    writeLines(text, con = data_doc_path)
    # Info message to user
    cli::cli_alert_info("Data documentation file for '{data}' created at: {.path {data_doc_path}}")
  }
  usethis::edit_file(data_doc_path, open = open)

  # DATA EXAMPLES ----
  data_example_path <- here::here("inst", "examples", paste0(data, ".R"))
  if (fs::file_exists(data_example_path)) {
    cli::cli_abort("File {.path {data_example_path}} already exists, skipping !")
  } else {
    fs::file_create(data_example_path)
    # Info message to user
    cli::cli_alert_info("Data example file for '{data}' created at: {.path {data_example_path}}")
  }
  usethis::edit_file(data_example_path, open = open)
}
