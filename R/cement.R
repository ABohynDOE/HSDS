#' Tensile strength of cement
#'
#' Tensile strength of different batches of cement after different curing times.
#' The tensile strength of cement depends on (among other things) the length of
#' time for which the cement is dried or 'cured'. The relationship between
#' curing time and strength is non-linear. Hald regresses log tensile strength
#' on the reciprocal of curing time.
#'
#' @format A data frame with 21 rows and 2 columns:
#' \describe{
#'   \item{time}{Curing time in days}
#'   \item{strength}{Tensile strength (kg/cm2)}
#' }
#' @source {Hald, A. (1952) \emph{Statistical Theory with Engineering
#'   Applications}, New York: John Wiley & Sons, 451.}
"cement"
