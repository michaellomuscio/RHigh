#' Computes a Two Sample T-Interval
#'
#' This function calculates a confidence interval for the difference between two population means
#' using a t-distribution. The confidence interval provides a range of plausible values for the
#' difference between two population means based on the means observed in two independent samples.
#' The width of the confidence interval gives an idea of how uncertain we are about the unknown difference.
#' A wider interval implies more uncertainty. The function assumes that the data follows a normal
#' distribution and that the samples are independent and random.
#'
#' @param variable1 A numeric vector of data values for the first sample.
#' @param variable2 A numeric vector of data values for the second sample.
#' @param confidence_level The confidence level for the interval, often 0.95 is used.
#' @return A list containing the lower and upper bounds of the confidence interval.
#' @examples
#' \dontrun{
#' two_sample_t_interval(c(1,2,3,4,5), c(2,4,6,8,10), 0.95)
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd


two_sample_t_interval <- function(variable1, variable2, confidence_level) {

  difference <- mean(variable1, na.rm = TRUE) - mean(variable2, na.rm = TRUE)
  n1 <- length(na.omit(variable1))
  n2 <- length(na.omit(variable2))
  degrees_of_freedom <- min(n1 - 1, n2 - 1)
  half_alpha <- (1-confidence_level)/2

  #In pt the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(variable > input)

  t_score <- qt(half_alpha, degrees_of_freedom, lower.tail = FALSE, log.p = FALSE)
  margin_of_error <- t_score*(sqrt( ((sd(variable1, na.rm = TRUE)^2)/n1) + ((sd(variable2, na.rm = TRUE)^2)/n2)))
  lower_bound <- difference - margin_of_error
  upper_bound <- difference + margin_of_error
  results <- tibble::tibble(
    difference = difference,
    degrees_of_freedom = degrees_of_freedom,
    margin_of_error = margin_of_error,
    lower_bound = lower_bound,
    upper_bound = upper_bound
  )

  return(results)
}
