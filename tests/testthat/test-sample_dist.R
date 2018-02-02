context("sample_dist")


# Dummy function
dist <- function(n = NULL) {return(n)}

test_that("sample_dist functions correctly with a dummy function", {
  result <- rpois(1,lambda = 10)

  test <- sample_dist(result, dist = dist)
  class(test) <- "integer"
expect_equal(result, test)
  })

test_that("sample_dist errors when a number of samples is not supplied", {
  expect_error(sample_dist(dist = rnorm))
})


test_that("sample_dist errors when the number of samples is supplied as a character", {
  expect_error(sample_dist(n = "1", dist = rnorm))
})

test_that("sample_dist errors when the number of samples is not an integer", {
  expect_error(sample_dist(n = 1.2, dist = rnorm))
})

test_that("sample_dist errors when the number of samples is a vector", {
  expect_error(sample_dist(n = c(1,2), dist = rnorm))
})

test_that("sample_dist errors when a function is not passed as the distribution", {
  expect_error(sample_dist(n = 1, dist = 2))
  expect_error(sample_dist(n = 1, dist = "2"))
  expect_error(sample_dist(n = 1, dist = data.frame(x = 1)))
})
