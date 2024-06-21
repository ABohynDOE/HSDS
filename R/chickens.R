#' Weight of chickens
#'
#' Data from a randomized blocked experiment to investigate the effect of a drug
#' added to the feed of chicks in an attempt to promote growth. The comparison
#' is between three treatments: standard feed (control), standard feed plus low
#' dose of drug, standard feed plus high dose of drug. The experimental unit is
#' a group of chicks, reared and fed together in the birdhouse. The experimental
#' units are grouped three to a block, with physically adjacent units going in
#' the same block.
#'
#' @format A data frame with 24 rows and 3 columns:
#' \describe{
#'   \item{block}{Block corresponding to a bird house}
#'   \item{dose}{Dose of drug added to the diet (`control`, `low` or `high`)}
#'   \item{weight}{Average weight per bird (in pounds) at maturity for the group
#'   of birds in each experimental unit}
#' }
#'
#' @example inst/examples/chickens.R
#'
#' @source {Snee, R.D. (1985) \emph{Graphical display of results of
#'   three-treatment randomized block experiments}. Applied Statistics, 34,
#'   71-7.}
"chickens"
