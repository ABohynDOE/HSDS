#' Tearing factor for paper
#'
#' Data from an experiment in which five different pressures were applied during
#' the sheet-pressing phase in the manufacture of paper.
#'
#' The aim was to investigate the effect of pressure on the \emph{tear factor}
#' of the paper, which is the percentage of a standard force which is necessary
#' to tear the paper.
#' Four sheets of paper were selected and tested from each of five batches made
#' at different pressures.
#' The pressures are equally spaced on a log scale, suggesting that the
#' investigator expected equal changes in the ratio of pressures to produce
#' equal changes in tearing factor.
#' A log transformation of pressure may thus be appropriate.
#'
#' @format A data frame with 20 rows and 2 columns:
#' \describe{
#'   \item{pressure}{Pressure applied during pressing}
#'   \item{tear_factor}{Tear factor}
#'   \item{height}{Height of the plant in inches}
#' }
#' @source {Williams, E.J. (1959) \emph{Regression Analysis}, New York: John Wiley & Sons, 17.}
"tearing"
