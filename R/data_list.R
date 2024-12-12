#' Data processing status
#'
#' List the data sets already processed in the package.
#'
#' @param print Number of unprocessed data sets to print (default is 5)
#' @keywords internal
data_list <- function(print = 5) {
  # Load the raw data index and the current data index
  source("data-raw/data_index.R")

  # List data sets already processed and all the files too
  # They are present in the "R/data" directory
  all_files <- raw_data_index$file_name |>
    stringr::str_remove('.DAT') |>
    stringr::str_to_lower()
  processed_files <- data_index$name
  n_proc <- length(processed_files)

  # Isolate the unprocessed files
  unprocessed_files <- setdiff(all_files, processed_files)
  n_unproc <- length(unprocessed_files)

  # Print the number of processed/unprocessed files
  cli::cli_alert_success("{.strong {n_proc}} files already processed")
  cli::cli_alert_danger("{.strong {n_unproc}} files to process:")

  # Print the first `print` unprocessed files
  ul <- cli::cli_ul()
  purrr::walk(
    .x = seq_len(print),
    .f = \(.x) {
      file <- unprocessed_files[.x]
      desc <- raw_data_index$description[which(all_files == file)]
      cli::cli_li("{.strong {file}}: {desc}")
    }
  )
  cli::cli_text("...and {n_unproc - n_proc} more !")
  cli::cli_end(ul)
}
