#' Setup for a new data set
#'
#' Generate the three files needed for a new data set:
#' - A file to import the raw data as an R data set
#' - A file to generate the documentation of the data set
#' - A file to contain the examples for the data generated
#' and opens the file interactively if needed.
#'
#' @param data Name of the data set for which the files are created. Must be an existing `.dat` file in the `data-raw` folder.
#' @param open Whether to open the files for interactive editing.
#' @md
#' @keywords internal
data_setup <- function(data, open = TRUE) {

  # Data checks -------------------------------------------------------------

  # Data must be a string
  if (!rlang::is_character(data)) {
    cli::cli_abort("{.var data} must be a character")
  }

  # Data must correspond to a raw data file in `data-raw`
  raw_data_path <- fs::path("data-raw/data-files", data, ext = "dat")
  if (!fs::file_exists(data_path)) {
    cli::cli_abort("Raw data file {.file {raw_data_path}} does not exist!")
  }

  # The data file cannot already be loaded
  data_path <- fs::path("data", data, ext = "rda")
  if (fs::file_exists(data_path)) {
    cli::cli_abort("File {.file {data_path}} already exists!")
  }

  # Example file ------------------------------------------------------------

  usethis::use_template(
    template = "example.R",
    save_as = fs::path("inst/examples/", data, ext = "R"),
    open = open,
    data = list(data = data),
    package = "hsds"
  )


  # Documentation file ------------------------------------------------------

  usethis::use_template(
    template = "documentation.R",
    save_as = fs::path("R/", data, ext = "R"),
    open = open,
    data = list(
      example_path = fs::path("inst/examples/", data, ext = "R"),
      data = data
    ),
    package = "hsds"
  )

  # Data import file --------------------------------------------------------

  usethis::use_template(
    template = "data_import.R",
    save_as = fs::path("data-raw/", data, ext = "R"),
    open = open,
    data = list(data = data),
    package = "hsds"
  )
}
