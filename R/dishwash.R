#' Comparing dish washing detergents
#'
#' An experiment was carried out to compare dish washing detergents. Standard
#' plates were soiled with standard dirt, and an operator then washed the plates
#' in a detergent solution one at a time. The response variable was the number
#' of plates washed before the foam disappeared. Three basins were set up, with
#' an operator for each, and the three Operators took care to wash at the same
#' rate. A different detergent was used in each basin. Thus the experimental
#' unit was a single washing-up session in one basin, and the units were grouped
#' in blocks of three (being the washing-up sessions carried out
#' simultaneously). Since there were nine detergents to compare in blocks of
#' size three, a balanced incomplete block design was used.
#'
#' @format A data frame with 36 rows and 3 columns:
#' \describe{
#'   \item{block}{Washing up session. Factor with levels '1' to '12'}
#'   \item{detergent}{Detergent brand. Factor with levels '1' to '9'}
#'   \item{plates}{Number of plates washed until the foam disappeared}
#' }
#'
#' @example inst/examples/dishwash.R
#'
#' @source {John, P.W.M. (1961) \emph{An application of a balanced incomplete
#'   block design}, Technometrics, 3, 51-54.}
"dishwash"
