library(dplyr)
library(tidyr)
library(gt)
library(hsds)

# Generate all possible cases of detergent and block, then add the recorded
# values from the experiment
all_cases <- dishwash %>%
  expand(block, detergent) %>%
  left_join(dishwash, by = join_by(block, detergent))

# Display as a visually appealling table, showing the incomplete blocked design
# structure
all_cases %>%
  labelled::set_variable_labels(plates = NULL) %>%
  pivot_wider(
    names_from = "detergent",
    values_from = "plates"
  ) %>%
  gt() %>%
  sub_missing() %>%
  cols_label(block ~ "Block") %>%
  tab_spanner("Detergent", columns = -block) %>%
  cols_width(everything() ~ px(40))
