library(sf)
library(ggplot2)
library(rnaturalearth)
library(hsds)

# Retrieve base map of England
england <- ne_states(country = "united kingdom")

# Convert long and lat into `sf` geometry
water %>%
  st_as_sf(coords = c("lon", "lat"), crs = 4326) %>%
  ggplot() +
  geom_sf(data = england, fill = NA) +
  geom_sf(aes(fill = mortality), shape = 21, size = 2) +
  coord_sf(xlim = c(-10, 2), ylim = c(50, 56)) +
  scale_fill_gradient(
    name = "Mortality per 100,000 hab.",
    low = "lightgrey",
    high = "darkred"
  ) +
  theme_bw(13) +
  theme(legend.position = "bottom")
