#' Mortality and water hardness
#'
#' Annual mortality rate per 100 000 for males, averaged over the years 1958-1964, and the calcium concentration (in parts per million) in the drinking water supply for 61 large towns in England and Wales.
#'
#' @format A data frame with 61 rows and 5 columns:
#' \describe{
#'   \item{town}{Name of the town, as a factor variable}
#'   \item{mortality}{Mortality rate per 100,000 inhabitants}
#'   \item{calcium}{Calcium concentration in the drinking water in parts per million (ppm)}
#'   \item{lon}{Longitude using the EPSG:4326 coordinate system}
#'   \item{lat}{Latitude using the EPSG:4326 coordinate system}
#' }
#'
#' @example inst/examples/water.R
#'
#' @source {Hills, M. and the M345 Course Team (1986) \emph{M345 Statistical Methods, Unit 3: Examining Straight-line Data}, Milton Keynes: The Open University, 28. Data provided by Professor M.J. Gardner, Medical Research Council Environmental Epiderniology Research Unit, Southampton.}
"water"
