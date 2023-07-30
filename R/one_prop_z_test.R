#' Performs a One Proportion Z-Test
#'
#' This function implements a One Proportion Z-Test, a statistical hypothesis test used to determine
#' whether the proportion of successes in a single sample differs significantly from a hypothesized
#' population proportion. The test assumes that the data follows a binomial distribution and that the
#' sample is random. The function calculates the test statistic and the p-value. The test statistic
#' follows a standard normal distribution under the null hypothesis. The p-value represents the
#' probability that a z-statistic as extreme as the observed one could occur by chance if the null
#' hypothesis were true.
#'
#' @param x The number of observed successes in the sample.
#' @param n The size of the sample.
#' @param p0 The hypothesized population proportion.
#' @param alternative The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".
#' @return A list containing the test statistic and the p-value.
#' @examples
#' \dontrun{
#' one_prop_z_test(5,10,0.5,"not_equal")
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd

one_prop_z_test <- function(x, n, p0, alternative) {
  estimate <- x/n
  standardDeviation <- sqrt((p0*(1-p0))/n)
  z_data <- (estimate-p0)/standardDeviation
  #In pnorm the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(x > input)

  #left.tail
  if(alternative == "less"){
    p_value <- pnorm(z_data, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)

    results <- tibble::tibble(
      estimate = estimate,
      z = z_data,
      p_value = p_value,
    )
  }

  #right.tail
  if(alternative == "greater"){
    p_value <- pnorm(z_data, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      estimate = estimate,
      z = z_data,
      p_value = p_value,
    )
  }

  #two.tail
  if(alternative == "not_equal"){
    z_data <- abs(z_data)
    p_value <- 2*pnorm(z_data, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      estimate = estimate,
      z = z_data,
      p_value = p_value,
    )
  }



  return(results)
}
