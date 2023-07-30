#' Computes a One Proportion Z-Interval
#'
#' This function calculates a confidence interval for a population proportion using a z-distribution.
#' The confidence interval provides a range of plausible values for the population proportion based on
#' the proportion observed in a sample. The width of the confidence interval gives an idea of how
#' uncertain we are about the unknown population proportion. A wider interval implies more uncertainty.
#' The function assumes that the data follows a binomial distribution and that the sample is random.
#' @param x The number of observed successes in the sample.
#' @param n The size of the sample.
#' @param confidence_level The confidence level for the interval, often 0.95 is used.
#' @return A list containing the lower and upper bounds of the confidence interval.
#' @examples
#' \dontrun{
#' one_prop_z_interval(5, 10, 0.95)
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd


one_prop_z_interval <- function(x, n, confidence_level) {
  estimate <- x/n
  half_alpha <- (1-confidence_level)/2
  #In qnorm the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(x > input)
  z_score <- qnorm(half_alpha, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
  margin_of_error <- z_score*(sqrt((estimate*(1-estimate))/n))
  lower_bound <- estimate - margin_of_error
  upper_bound <- estimate + margin_of_error
  results <- tibble::tibble(
    estimate = estimate,
    margin_of_error = margin_of_error,
    lower_bound = lower_bound,
    upper_bound = upper_bound
  )

  return(results)
}
