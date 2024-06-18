# WATER
library(dplyr)
library(stringr)
library(tmaptools) # For Geo coding town names

# .dat file does not correspond to the github repo cited in README because it
# did not contain the town names. Data from the book are used instead.
water <- readr::read_delim(
  file = here::here("data-raw", "data-files", "water.dat"),
  col_names = c("town", "mortality", "calcium"),
  col_types = c("c", "n", "n")
) %>%
  # Define towns in Derby
  mutate(town = str_remove(town, "•")) %>%
  # Add variable labels
  labelled::set_variable_labels(
    town = "Town",
    mortality = "Mortality per 100,000 inhabitants",
    calcium = "Calcium concentration (ppm)"
  )

# Retrieve the LON and LAT values of the towns
town_names <- paste0(water$town, ", United Kingdom")

# WARNING: time-consuming step
town_coordinates <- geocode_OSM(town_names) %>%
  select(town = query, lat, lon) %>%
  mutate(town = str_remove(town, ", United Kingdom"))

# Merge with water data
water <- water %>%
  left_join(town_coordinates, by = join_by(town)) %>%
  labelled::set_variable_labels(
    lon = "Longitude",
    lat = "Latitude"
  ) %>%
  mutate(
    town = forcats::as_factor(town)
  )

usethis::use_data(water, overwrite = TRUE)
