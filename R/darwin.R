#' Guessing lengths
#'
#' Data from Darwin's study of cross- and self-fertilization.
#'
#' Pairs of seedlings of the same age, one produced by cross-fertilization and
#' the other by self-fertilization, were grown together so that the members of
#' each pair were reared under nearly identical conditions.
#' The aim was to demonstrate the greater vigour of the cross-fertilized plants.
#' The data are the final heights of each plant after a fixed period of time.
#' Darwin consulted Galton about the analysis of these data, and they were
#' discussed further in Fisher's Design of Experiments.
#'
#' @format A data frame with 30 rows and 3 columns:
#' \describe{
#'   \item{pair}{Unique ID for the seedling pair}
#'   \item{fertilization}{Type of fertilization (`cross` of `self`)}
#'   \item{height}{Height of the plant in inches}
#' }
#' @source {Darwin, C. (1876) The Effect of Cross- and Self-fertilization in the Vegetable Kingdom, 2nd edition, London: John Murray.}
"darwin"
