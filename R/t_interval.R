#' Computes a One Sample T-Interval
#'
#' This function calculates a confidence interval for a population mean using a t-distribution. The
#' confidence interval provides a range of plausible values for the population mean based on the mean
#' observed in a single sample. The width of the confidence interval gives an idea of how uncertain we
#' are about the unknown population mean. A wider interval implies more uncertainty. The
#' function assumes that the data follows a normal distribution and that the sample is random.
#'
#' @param variable1 A numeric vector of data values.
#' @param confidence_level The confidence level for the interval, often 0.95 is used.
#' @return A list containing the lower and upper bounds of the confidence interval.
#' @examples
#' \dontrun{
#' t_interval(c(1,2,3,4,5), 0.95)
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd


t_interval <- function(variable1, confidence_level) {
  estimate <- mean(variable1, na.rm = TRUE)
  half_alpha <- (1-confidence_level)/2
  n <- length(na.omit(variable1))
  degrees_of_freedom <- n-1
  #In qt the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(variable1 > input)
  t_score <- qt(half_alpha, degrees_of_freedom, lower.tail = FALSE, log.p = FALSE)
  margin_of_error <- t_score*(sd(variable1, na.rm = TRUE)/sqrt(n))
  lower_bound <- estimate - margin_of_error
  upper_bound <- estimate + margin_of_error
  results <- tibble::tibble(
    estimate = estimate,
    degrees_of_freedom = degrees_of_freedom,
    margin_of_error = margin_of_error,
    lower_bound = lower_bound,
    upper_bound = upper_bound
  )

  return(results)
}
