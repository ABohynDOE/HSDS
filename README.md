# HSDS <img src="man/figures/logo.svg" align="right" height="139"/>

The goal of [HSDS](https://github.com/ABohynDOE/HSDS) is to make all the data sets of the book ["A Handbook of Small Data Sets"](https://www.routledge.com/A-Handbook-of-Small-Data-Sets/Hand-Daly-McConway-Lunn-Ostrowski/p/book/9780367449667) (1994) of David J. Hand available. These data sets are particularly useful to demonstrate examples of function or statistical tests, but also to teach about statistics and R.

All data sets are already available individually at this repo: <https://github.com/JedStephens/Handbook-of-Small-Data-Sets/tree/master>. However, they are not immediately usable in R, and undocumented. This package aims to solve this issue, and provide clean and documented data sets.

Do you like this package and want to support me ? 
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/abohyn)


## Installation

You can install the development version of HSDS like so:

``` r
devtools::install_github("ABohynDOE/HSDS")
```

## Available data sets

The book contains more than 500 data sets. For the moment, only some are available. They are summarized in the table below, along with their names, what they contain, their structure, and the type of variables present.

| Name       | Title                                                | Structure      | Variables                    |
|------------------|------------------|------------------|-------------------|
| `germin`   | Germinating seeds                                    | $48 \times 3$  | binary, categorical, numeric |
| `lengths`  | Guessing lengths                                     | $113 \times 3$ | binary, numeric(2)           |
| `darwin`   | Darwin's cross-fertilized and self-fertilized plants | $30 \times 3$  | numeric(2), binary           |
| `interval` | Intervals between cars on the M1 motorway            | $41 \times 2$  | numeric, datetime            |
| `tearing`  | Tearing factor for paper                             | $20 \times 2$  | numeric(2)                   |
| `abrasion` | Abrasion loss                                        | $30 \times 3$  | numeric(3)                   |

## Example

This is a basic example which shows you how to use a data set to make a nice plot:

``` r
library(HSDS)
library(ggplot2)

ggplot(germin, aes(x = water, y = seeds, color = box)) +
  geom_boxplot(na.rm = T) +
  theme_bw()
```

## Contributing

We are far from the 500 data sets, so any help is welcome ! If you want to contribute, all raw data sets are already present in the repo (at `data-raw/data-files`), so feel free to clean one or more... ! If you do so, please respect the following guidelines:

-   data sets should be named after the data structure index of the book (available [here](https://github.com/JedStephens/Handbook-of-Small-Data-Sets/blob/master/data_structure_index_HSDS.pdf))

-   all variables in the data set should be labelled (using the [`labelled`](https://cran.r-project.org/web/packages/labelled/vignettes/intro_labelled.html) package for example)

-   data sets should be documented using the text from the book

-   when you add a data set, modify the current `README` file accordingly
