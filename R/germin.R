#' Germinating seeds data
#'
#' @description
#' Data from an experiment to study the effect of different amounts of water on
#' the germination of seeds
#'
#' For each amount of water, four identical boxes were sown with 100 seeds each,
#' and the number of seeds having germinated after two weeks was recorded.
#' The experiment was repeated with the boxes covered to slow evaporation.
#' There were six levels of watering, coded 1 to 6, with higher codes
#' corresponding to more water.
#'
#' @details
#' Chatfield used the data as an example of how preparing appropriate graphical
#' representations is an essential for appropriate interpretation of data.
#'
#'
#' @format A data frame with 48 rows and 3 columns:
#' \describe{
#'   \item{box}{Factor. Box covering (`Covered` or `Uncovered`)}
#'   \item{water}{Factor. Water level in the box, with higher codes corresponding to more water (1 to 6)}
#'   \item{seeds}{Number of germinated seeds, out of 100}
#' }
#' @source {Chatfield, C. (1982) \emph{Teaching a course in applied statistics}, Applied Statistics, 31, 272-89.}
"germin"
