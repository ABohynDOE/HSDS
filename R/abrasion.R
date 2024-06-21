#' Abrasion loss
#'
#' Data from an experiment to investigate how the resistance of ruhher to
#' abrasion is affected by the hardness of the ruhher and its tensile strength.
#'
#' Each of 30 samples of rubber was tested for hardness (in degrees Shore; the
#' larger the number, the harder the rubber) and for tensile strength (measured
#' in kg per square centimetre), and was then subjected to steady abrasion for a
#' fixed time. The weight loss due to abrasion was measured in grams per hour.
#' The data could be analysed by regression with two explanatory variables.
#'
#' @format A data frame with 30 rows and 3 columns:
#' \describe{
#'   \item{abrasion_loss}{Loss of rubber over a fixed period of time (in grams
#'   per hour)}
#'   \item{hardness}{Hardness of the rubber in degrees Shore (the larger the
#'   number, the harder the rubber)}
#'   \item{tensile_strength}{Tensile strength of the rubber (in kg per squared
#'   centimetres)}
#' }
#' @examples
#' data(abrasion)
#' mod <- lm(abrasion_loss ~ tensile_strength + hardness, data = abrasion)
#' summary(mod)
#'
#' plot(abrasion$hardness, abrasion$abrasion_loss, xlab = "Hardness", ylab =
#' "Abrasion loss")
#'
#' @source {Davies, O.L. and Goldsmith, P.L. (eds.) (1972) \emph{Statistical
#'   Methods in Research and Production}, 4th Edition, Edinburgh: Oliverand
#'   Boyd, 239.}
"abrasion"
