% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chickens.R
\docType{data}
\name{chickens}
\alias{chickens}
\title{Weight of chickens}
\format{
A data frame with 24 rows and 3 columns:
\describe{
  \item{block}{Block corresponding to a bird house}
  \item{dose}{Dose of drug added to the diet (`control`, `low` or `high`)}
  \item{weight}{Average weight per bird (in pounds) at maturity for the group
  of birds in each experimental unit}
}
}
\source{
{Snee, R.D. (1985) \emph{Graphical display of results of
  three-treatment randomized block experiments}. Applied Statistics, 34,
  71-7.}
}
\usage{
chickens
}
\description{
Data from a randomized blocked experiment to investigate the effect of a drug
added to the feed of chicks in an attempt to promote growth. The comparison
is between three treatments: standard feed (control), standard feed plus low
dose of drug, standard feed plus high dose of drug. The experimental unit is
a group of chicks, reared and fed together in the birdhouse. The experimental
units are grouped three to a block, with physically adjacent units going in
the same block.
}
\examples{
library(hsds)
library(ggplot2)
library(lme4)

# Plot of the average weight per diet, on top of a box plot
ggplot(chickens, aes(x = dose, y = weight)) +
  geom_boxplot(color = "gray") +
  geom_line(aes(color = block, group = block)) +
  geom_point(aes(color = block), size = 2) +
  theme_classic()

# Model of the weight by dose, taking into account the random variation within
# each individual unit
mod <- lmer(weight ~ dose + (1 | block), data = chickens)
summary(mod)

# The `modelbased` package is great to estimate marginal means
modelbased::estimate_means(mod, at = c("dose"))

# Or to estimate contrasts to see if there is a significant difference in weight
# between diets
modelbased::estimate_contrasts(mod, contrast = "dose", p_adjust = "tukey")
}
\keyword{datasets}
