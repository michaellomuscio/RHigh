#' Computes a Two Proportion Z-Interval
#'
#' This function calculates a confidence interval for the difference between two population proportions
#' using a z-distribution. The confidence interval provides a range of plausible values for the difference
#' between two population proportions based on the proportions observed in two independent samples.
#' The width of the confidence interval gives an idea of how uncertain we are about the unknown difference.
#' A wider interval implies more uncertainty. The function assumes that the data follows a binomial
#' distribution and that the samples are independent and random.
#' @param x1 The number of observed success in sample 1.
#' @param n1 The size of sample 1.
#' @param x2 The number of observed success in sample2.
#' @param n2 The size of sample 2.
#' @param confidence_level The confidence level for the interval, often 0.95 is used.
#' @return A list containing the lower and upper bounds of the confidence interval.
#' @examples
#' \dontrun{
#' two_prop_z_interval(5, 10, 50, 100, 0.95)
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd


two_prop_z_interval <- function(x1, n1, x2, n2, confidence_level) {
  half_alpha <- (1-confidence_level)/2
  estimate1 <- x1/n1
  estimate2 <- x2/n2
  difference <- estimate1 - estimate2
  standardDeviation <- sqrt( ((estimate1 * (1 - estimate1))/n1) + ((estimate2 * (1 - estimate2))/n2))
  #In qnorm the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(x > input)
  z_score <- qnorm(half_alpha, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)
  margin_of_error <- z_score*standardDeviation
  lower_bound <- difference - margin_of_error
  upper_bound <- difference + margin_of_error
  results <- tibble::tibble(
    difference = difference,
    margin_of_error = margin_of_error,
    lower_bound = lower_bound,
    upper_bound = upper_bound
  )

  return(results)
}
