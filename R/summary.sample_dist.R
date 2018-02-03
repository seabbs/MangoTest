
#' Summarising a sample of a probability distribution.
#'
#' @description \code{summary} method for class "sample_dist".
#' @param object A numeric vector of class "sample_dist".
#' @param plot Logical, defaults to \code{TRUE}. Produces a summary plot.
#' @param ... Pass additional arguements to summary function.
#' @seealso summary
#' @aliases summary
#' @method summary sample_dist
#' @return Prints a summary table to the terminal and a summary plot.
#' @export
#' @import ggplot2
#' @examples
#' ## Sample from a normal distribution
#' x <- sample_dist(100, dist = rnorm)
#'
#' ## Create a summary
#' summary(x)
summary.sample_dist <- function(object = NULL, plot = TRUE, ...) {
  if (is.null(object)) {
    stop("A vector of samples from a probability distribution is required")
  }

  if (!is.numeric(object)) {
    stop("The vector of probability samples must be numeric")
  }

  n <- length(object)
  min <- min(object)
  max <- max(object)
  mean <- mean(object)
  median <- median(object)
  lll <- quantile(object, 0.025)
  ll <- quantile(object, 0.25)
  hh <- quantile(object, 0.75)
  hhh <- quantile(object, 0.975)

  sum_list <- c(Samples = n,
                Minimum = min,
                lll,
                ll,
                Median = median,
                Mean = mean,
                hh,
                hhh,
                Maximum = max
                )

  rest_sum_list <- sum_list[c("2.5%", "25%", "Mean", "Median", "75%", "97.5%")]

  if (plot) {
    samples <- NULL
    value <- NULL
    Measures <- NULL
    quantile <- NULL

    plot <- ggplot(data.frame(samples = object),
                   aes(x = samples, fill = 1)) +
      geom_vline(data = data.frame(Measures = names(rest_sum_list),
                                   value = rest_sum_list),
                 aes(xintercept = value,
                     linetype = Measures)) +
      geom_density(alpha = 0.5, show.legend = c(fill = FALSE)) +
      geom_rug() +
      theme_minimal() +
      theme(legend.position = "bottom") +
      guides(linetype = guide_legend(title = "Summary measures")) +
      labs(title = "Distribution of Probability Samples",
           caption = paste0("Showing distribution of ", n, " samples"),
           y = "Density",
           x = "Samples")

    print(plot)
  }

  return(sum_list)
}
