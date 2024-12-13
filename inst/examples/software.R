# Distribution of the failure time
with(
  software,
  hist(
    time,
    main = "Distribution of the failure times",
    xlab = "Failure time (CPU seconds)"
  )
)

# Plot of the cumulative number of events over time
with(
  software,
  plot(
    time,
    failure_id,
    main = "Cumulative number of failures over time",
    xlab = "Time (CPU seconds)", ylab = "Number of failures"
  )
)
# Add lines
with(software, lines(time, failure_id))
