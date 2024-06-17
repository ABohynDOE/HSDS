# HSDS <img src="man/figures/logo.svg" align="right" height="139"/>

The goal of HSDS is to make all the data sets of the book "A Handbook of Small Data Sets" (1994) of David J. Hand. These data sets are particularly useful to demonstrate examples of function or statistical tests, but also to teach about statistics and R.

## Installation

You can install the development version of HSDS like so:

``` r
devtools::install_github("ABohynDOE/HSDS")
```

## Available data sets

The book contains more than 200 data sets. For the moment, only `r length(list.files("data"))` are available. The table below summarizes the data sets, displaying their names, what they contain, their structure, and the type of variables present.

| Name      | Title             | Structure      | Variables                    |
|-----------|-------------------|----------------|------------------------------|
| `germin`  | Germinating seeds | $48 \times 3$  | binary, categorical, numeric |
| `lengths` | Guessing lengths  | $113 \times 3$ | binary, numeric(2)           |
|           |                   |                |                              |

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(HSDS)
library(ggplot2)

ggplot(germin, aes(x = water, y = seeds, color = box)) +
  geom_boxplot(na.rm = T) +
  theme_bw()
```
