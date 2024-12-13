#' Data processing status
#'
#' List the data sets already processed in the package.
#'
#' @param print Number of unprocessed data sets to print (default is 5)
#' @param print_done Print the names of the data sets already processed (default
#'   is FALSE)
#' @keywords internal
data_list <- function(print = 5, print_done = FALSE) {
  source("data-raw/data_index.R")

  # List data sets already processed and all the files too
  # They are present in the "R/data" directory
  all_files <- raw_data_index$name
  proc_files <- data_index$name
  n_proc <- length(proc_files)

  # Isolate the unprocessed files
  unproc_files <- setdiff(all_files, proc_files)
  n_unproc <- length(unproc_files)

  # Print the number of processed files
  cli::cli_alert_success("{.strong {n_proc}} data sets already processed")

  # If needed, print the names of the processed files
  if (print_done) {
    proc_desc <- data_index$description
    # Create a list div and print the processed files and their description
    list_files(proc_files, proc_desc, col = "forestgreen")
  }

  # Print the number of unprocessed files
  cli::cli_alert_danger("{.strong {n_unproc}} files to process:")

  # Print the first `print` number of unprocessed files
  print_unproc_files <- unproc_files[seq_len(print)]
  print_unproc_desc <- raw_data_index |>
    filter(name %in% print_unproc_files) |>
    pull(description)
  list_files(print_unproc_files, print_unproc_desc, col = "darkred")
  cli::cli_ul("...and {n_unproc - n_proc} more !")
  cli::cli_alert_info(
    "Use {.code data_setup(data = \"{unproc_files[1]}\")} to generate the adequate files to process the next set"
  )
}

#' @keywords internal
list_files <- function(files, desc, col = "black") {
  cli::cli_div(theme = list(span.strong = list(color = col)), .auto_close = TRUE)
  cli::cli_ul(.auto_close = TRUE)
  purrr::walk2(
    .x = files,
    .y = desc,
    .f = \(x, y) {cli::cli_li("{.strong {x}}: {y}")}
  )
}
