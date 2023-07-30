#' Performs a Two Proportion Z-Test
#'
#' This function implements a Two Proportion Z-Test, a statistical hypothesis test used to determine
#' whether the proportions of successes in two independent samples differ significantly. The test
#' assumes that the data follows a binomial distribution and that the samples are independent and random.
#' The function calculates the test statistic and the p-value. The test statistic follows a standard
#' normal distribution under the null hypothesis. The p-value represents the probability that a
#' z-statistic as extreme as the observed one could occur by chance if the null hypothesis were true.
#'
#' @param x1 The number of observed successes in the sample 1.
#' @param n1 The size of the sample 1.
#' @param x2 The number of observed successes in the sample 2.
#' @param n2 The size of the sample 2.
#' @param alternative The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".
#' @return A list containing the test statistic and the p-value.
#' @examples
#' \dontrun{
#' two_prop_z_test(5, 10, 50, 100,"not_equal")
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd

two_prop_z_test <- function(x1, n1, x2, n2, alternative) {
  estimate1 <- x1/n1
  estimate2 <- x2/n2
  difference <- estimate1 - estimate2
  p_pooled <- (x1 + x2)/(n1 + n2)
  standardDeviation <- sqrt(p_pooled * (1 - p_pooled) * ((1/n1) + (1/n2)))
  z_data <- difference/standardDeviation
  #In pnorm the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(x > input)

  #left.tail
  if(alternative == "less"){
    p_value <- pnorm(z_data, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)

    results <- tibble::tibble(
      difference = difference,
      z = z_data,
      p_value = p_value,
    )
  }

  #right.tail
  if(alternative == "greater"){
    p_value <- pnorm(z_data, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      difference = difference,
      z = z_data,
      p_value = p_value,
    )
  }

  #two.tail
  if(alternative == "not_equal"){
    z_data <- abs(z_data)
    p_value <- 2*pnorm(z_data, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      difference = difference,
      z = z_data,
      p_value = p_value,
    )
  }



  return(results)
}
