context("summary.sample_dist")



test <- sample_dist(1000, dist = rnorm)


result <- summary(test)

test_summary_measure <- function(test, result, sum_fn, fn_name, ...) {
  test_that(paste0("summary.sample_dist calculates the ", fn_name,  " correctly"), {
    expect_equal(as.numeric(result), as.numeric(sum_fn(test, ...)))
  })
}

test_summary_measure(test, result["Mean"], sum_fn = mean, fn_name = "mean")
test_summary_measure(test, result["Median"], sum_fn = median, fn_name = "median")
test_summary_measure(test, result["2.5%"], sum_fn = quantile, fn_name = "quantile", probs = 0.025)
test_summary_measure(test, result["Maximum"], fn_name = "max", sum_fn =  max)
test_summary_measure(test, result["Minimum"], fn_name = "min", sum_fn =  min)
