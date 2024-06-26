#' Software system failures
#'
#' These data give the failure times (in CPU seconds, measured in terms of
#' execution time) of areal-time command and control software system. The data
#' can be used as an example for fitting various reliability models. Musa et al.
#' recommend fitting a non-homogeneous Poisson process with linearly or
#' exponentially decreasing failure intensity.
#'
#' @format A data frame with X rows and X columns:
#' \describe{
#'   \item{time}{Time to the next software failure in CPU seconds}
#'   \item{event}{Cumulative number of failures at this time}
#' }
#'
#' @example inst/examples/software.R
#'
#' @source {Musa, J.D., Iannino, A. and Okumoto, K. (1987) \emph{Software reliability: measurement, prediction, application}, New York: McGraw-Hill, 305.}
#' @source {Musa, J.D. (1979) \emph{Software reliability data, Data and Analysis Center for Software}, Rome Air Development Center, Rome, NY.}
"software"
