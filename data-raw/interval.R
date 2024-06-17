library(dplyr)
library(stringr)
library(lubridate)

# Load the raw intervals
raw_interval <- readr::read_delim(
  file = here::here("data-raw", "data-files", "interval.dat"),
  delim = "\t",
  col_names = FALSE,
  show_col_types = FALSE
)

# Slice and stack the data set
interval <- rbind(
  as.matrix(raw_interval[,c(1, 2)]),
  as.matrix(raw_interval[,c(3, 4)]),
  as.matrix(raw_interval[,c(5, 6)])
) %>%
  as.data.frame() %>%
  # Add column names and convert "time" to date-time values
  magrittr::set_colnames(c('car', 'time')) %>%
  filter(!is.na(car)) %>%
  mutate(
    time_str = str_remove_all(time, "\\s") %>%
      str_pad(width = 6, side = "left", pad = "0"),
    time_str = gsub("(\\d{2})(\\d{2})(\\d{2})", "\\1:\\2:\\3", time_str),
    time = lubridate::hms(time_str),
    hour = hour(time),
    minute = minute(time),
    second = second(time),
  ) %>%
  select(car, hour:second)

# Add the times together to have uniform times
for (i in 1:nrow(interval)) {
  if (interval$hour[i] == 0) {
    interval$hour[i] <- interval$hour[i-1]
  }
  if (interval$minute[i] == 0) {
    interval$minute[i] <- interval$minute[i-1]
  }
}

# Clean the data sets and add variable labels
interval <- interval %>%
  mutate(
    time = paste(hour, minute, second, sep = ":") %>%
      lubridate::hms() %>%
      as.period(),
    .keep = "unused"
  ) %>%
  labelled::set_variable_labels(
    car = "Car ID",
    time = "Time of passing"
  )

usethis::use_data(interval, overwrite = TRUE)
