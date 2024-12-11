#' Software system failures
#'
#' These data give the failure times (in CPU seconds, measured in terms of
#' execution time) of a real-time command and control software system.
#' The data can be used as an example for fitting various reliability models.
#' Musa et al. recommend fitting a nonhomogenous Poisson process with linearly
#' exponentially decreasing failure time.
#'
#' @format A data frame with X rows and X columns:
#' \describe{
#'   \item{time}{Time to failure in CPU seconds}
#' }
#'
#' @example inst/examples/software.R
#'
#' @source {Musa, J.D., Iannino, A. and Okumoto, K. (1987) \emph{Software reliability: measurement,prediction, application}, New York: McGraw-Hill, 305.}
"software"
