
#' Sample from a Probability Distribution
#'
#' @description Function brief: Write a function that will draw random numbers
#'  from a given distribution. The function should take one argument for the
#'  number of samples and a second argument which specifies the distribution
#'  (Normal, Poisson or Binomial). The function should be able to handle
#'  additional parameters depending on the distribution chosen, e.g., a `lambda`
#'   for Poisson samples.
#' @param n Numeric, the number of samples to take.
#' @param dist A function which samples from a probability distribution. The first
#' arguement must be the number of samples, additional arguements can be specified with
#' \code{...}. Possible options are \code{rnorm} (normal), \code{rpois} (Poisson), and
#' \code{rbinom} (Binomial).
#' @param ... Additional arguements to pass to the specified \code{dist} function.
#'
#' @return A vector of samples from the specified distribution.
#' @export
#'
#' @examples
#'
#' ## Sample a single time from the normal distribution
#' sample_dist(1, dist = rnorm, mean = 0, sd = 1)
#'
#' ## Sample multiple times from the poisson distribution
#' sample_dist(100, dist = rpois, lambda = 2)
#'
sample_dist <- function(n = NULL, dist = NULL, ...) {
  if (is.null(n)) {
    stop("The number of samples must be specified, using n.")
  }

  if (!is.numeric(n)) {
    stop("The number of samples (n) must be numeric.")
  }

  if(!is.function(dist)) {
    stop("dist must be a function to sample from a probability distribution.
         An example for the normal distribution is rnorm")
  }

  samples <- dist(n, ...)

  class(samples) <- c("sample_dist", "numeric")

  return(samples)
}
