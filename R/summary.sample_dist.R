
#' Summarising a sample of a probability distribution.
#'
#' @description \code{summary} method for class "sample_dist".
#' @usage
#' ## S3 method for class
#' summary(sample_vect, plot = TRUE)
#' @param sample_vect A numeric vector of class "sample_dist".
#' @param plot Logical, defaults to \code{TRUE}. Produces a summary plot.
#' @seealso summary
#' @return Prints a summary table to the terminal
#' @export
#' @import ggplot2
#' @examples
#' ## Sample from a normal distribution
#' x <- sample_dist(100, dist = rnorm)
#'
#' ## Create a summary
#' summary(x)
summary.sample_dist <- function(sample_vect = NULL, plot = TRUE) {
  if (is.null(sample_vect)) {
    stop("A vector of samples from a probability distribution is required")
  }

  if(!is.numeric(sample_vect)) {
    stop("The vector of probability samples must be numeric")
  }

  n <- length(sample_vect)
  min <- min(sample_vect)
  max <- max(sample_vect)
  mean <- mean(sample_vect)
  median <- median(sample_vect)
  lll <- quantile(sample_vect, 0.025)
  ll <- quantile(sample_vect, 0.25)
  hh <- quantile(sample_vect, 0.75)
  hhh <- quantile(sample_vect, 0.975)

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
    plot <- ggplot(data.frame(samples = sample_vect),
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
