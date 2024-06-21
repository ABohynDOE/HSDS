#' Weight gain in rats
#'
#' The data come from an experiment to study the gain in weight of rats fed on
#' four different diets, distinguished by amount of protein (low and high) and
#' by source of protein (beef and cereal). The design of the experiment is
#' completely randomized with ten rats on each of the four treatments (which
#' have a complete factorial structure).
#'
#' @format A data frame with 30 rows and 3 columns:
#' \describe{
#'   \item{weight}{Weight gain in grams}
#'   \item{source}{Protein source (`beef` or `cereal`)}
#'   \item{amount}{Protein amount (`low` or `high`)}
#' }
#'
#' @example inst/examples/weight.R
#'
#' @source {Snedecor, G.W. and Cochran, G.C. (1967) \emph{Statistical Methods},
#'   6th edition, Ames, Iowa: Iowa State University Press, 347.}
"weight"
