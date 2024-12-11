#' Piston-ring failures
#'
#' Number of failures of piston-rings in each of three legs in each of four steam-driven compressors located in the same building.
#' The compressors have identical design and are oriented in the same way.
#'
#' Questions of interest are whether the probability of failure varies between compressors or between different legs, and whether the pattern of the location of failures is different for different compressors.
#' Davies and Goldsmith investigate these questions using chi-squared tests; log-linear analysis might be an alternative.
#'
#' @format A data frame with 12 rows and 3 columns:
#' \describe{
#'   \item{compressor_no}{Compressor number (1 to 4)}
#'   \item{leg}{Compressor leg (North, Center, South)}
#'   \item{n_failures}{Number of failures}
#' }
#'
#' @example inst/examples/piston.R
#'
#' @source {Davies, O.L. and Goldsmith, P.L. (eds.) (1972) \emph{Statistical Methods in Research and Production}, 4th Edition, Edinburgh: Oliverand Boyd, 324.}
"piston"
