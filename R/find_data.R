#' Find a data set for a specific topic
#'
#' Find all the data sets in the package with a keyword of interest. For each
#' data set, the following information are printed:
#' - Name of the data set (as a link to the reference page online !)
#' - Size (rows X columns)
#' - One-line description
#'
#' @param topic string. Topic of interest in the package
#' @param max_print numeric. Maximum number of data sets to print if more are
#'   found in the package
#'
#' @examples
#' find_data(topic = "non-linear")
#'
#' @md
#' @export
find_data <- function(topic, max_print = 10){
  # Check that topic is a string
  if (!is.character(topic)){
    cli::cli_abort("`topic` must be a string")
  }
  # All topics should be lowercase to avoid mismatches
  topic <- tolower(topic)
  # Retrieve all keywords in current database
  keywords <- current_data_index$keywords |>
    sapply(function(x) strsplit(x, ",")) |>
    sapply(trimws) |>
    unlist() |>
    unname()
  # Check that topic matches at least one keyword
  if (!(topic %in% keywords)) {
    cli::cli_abort(
      c(
        "x" = "'{topic}' is not a suggested topic",
        "i" = "See the list of all available topics at
        {.url https://abohyndoe.github.io/HSDS/}"
      )
    )
  }
  # Retrieve data sets matching the topic
  matching_data <- current_data_index[grep(topic, current_data_index$keywords), ]
  n_matches <- nrow(matching_data)
  # Print header with matching info
  cli::cli_h1("{n_matches} data set{?s} found for topic {.emph {topic}}")
  # Print info about each data set
  sub_matching_data <- head(matching_data, max_print)
  for (i in 1:nrow(sub_matching_data)) {
    row <- sub_matching_data[i, ]
    print_dataset_info(row$filename, row$title, row$size, row$structure)
  }
}

#' Print information about a data set using the `cli` package
#' @keywords internal
print_dataset_info <- function(name, description, size, ...){
  link <- paste0("https://abohyndoe.github.io/HSDS/reference/", name, ".html")
  cli::cli_bullets(
    c("*" = "{.href [{.strong {name}}]({link})} ({size}): {description}")
  )
}
