context("summary.sample_dist")



test <- sample_dist(1000, dist = rnorm)


result <- summary(test)

test_summary_measure <- function(test, result, sum_fn, ...) {
  test_that(paste0("summary.sample_dist calculates the",  sum_fn,  " correctly"), {
    expect_equal(result, sum_fn(test, ...))
  })
}

test_summary_measure(test, result$Mean, sum_fn = mean)
