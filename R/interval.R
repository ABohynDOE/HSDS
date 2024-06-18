#' Interval between cars on the M1 motorway
#'
#' Times that 41 successive vehicles travelling northwards along the M1 motorway
#' in England passed a fixed point near Junction 13 in Bedfordshire on Saturday
#' 23 March 1985.
#' The times are recorded on the 24-hour clock to the nearest second.
#'
#' The data were collected by Professor Toby Lewis as a sample of event times in
#' a point process which it may be appropriate to model as a Poisson process.
#'
#' @format A data frame with 48 rows and 3 columns:
#' \describe{
#'   \item{car}{Unique ID to define the cars}
#'   \item{time}{Time at which the car passed the junction. Encoded as a `period` object from the [lubridate] package}
#' }
#' @source {Lewis, T. and the M345 Course Team (1986) \emph{M345 Statistical Methods, Unit 2: Basic Methods: Testing and Estimation}, Milton Keynes: The Open University, 16.}
"interval"
