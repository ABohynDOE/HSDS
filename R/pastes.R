#' Strength of chemical pastes
#'
#' @description A chemical paste product is delivered in casks, and there are
#'   thought to be variations in the mean strength of the paste between delivery
#'   batches. When a batch arrives, the paste is tested by sampling casks from
#'   the batch and then analysing material from the casks. Further sources of
#'   error arise in the sampling and in the analysis. The data come from ten
#'   randomly chosen delivery batches; from each, three casks are selected at
#'   random, and two analyses are carried out on the contents of each selected
#'   cask. The response is the percentage paste strength in the analysed sample.
#'
#'
#' @details Davies and Goldsmith use the following data to demonstrate the use
#'   of analysis of variance in a hierarchical situation where the aim is to
#'   estimate variance components.
#'
#'   This data is also useful to demonstrate the difference between crossed and
#'   nested random effect structures in linear mixed models in R using the
#'   `lme4` package.
#'
#' @format A data frame with 60 rows and 4 columns:
#' \describe{
#'   \item{batch}{Factor. Batch number (1 to 10)}
#'   \item{cask}{Factor. Cask number within each cask(1 to 3)}
#'   \item{sample}{Factor. Sample number within each cask (1 or 2)}
#'   \item{strength}{Percentage paste strength in the analysed sample}
#' }
#'
#' @example inst/examples/pastes.R
#'
#' @source Davies, O.L. and Goldsmith, P.L. (eds.) (1972) \emph{Statistical
#'   Methods in Research and Production}, 4th Edition, Edinburgh: Oliver and
#'   Boyd, 136.
"pastes"
