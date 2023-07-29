#' Performs a One Sample T-Test
#'
#' This function implements a One Sample T-Test, which is a statistical hypothesis test used to
#' determine whether the mean of a sample differs significantly from a hypothesized population mean.
#' The test assumes that the data follows a normal distribution and that the sample is random.
#' The function calculates the test statistic and the p-value. The test statistic follows a t-distribution
#' under the null hypothesis. The p-value represents the probability that a t-statistic as extreme as the
#' observed one could occur by chance if the null hypothesis were true.
#'
#' @param variable1 A numeric vector of data values.
#' @param mu0 The hypothesized population mean.
#' @param alternative The the direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".
#' @return A list containing the test statistic and the p-value.
#' @examples
#' \dontrun{
#' t_test(c(1,2,3,4,5,6,7,8,9,10), 5, "not_equal")
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd


t_test <- function(variable1, mu0, alternative) {
  estimate <- mean(variable1, na.rm = TRUE)
  n <- length(na.omit(variable1))
  standardDeviation <- sd(variable1, na.rm = TRUE)/sqrt(n)
  t_data <- (estimate-mu0)/standardDeviation
  degrees_of_freedom <- n-1
  #In pt the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(variable1 > input)

  #left.tail
  if(alternative == "less"){
    p_value <- pt(t_data, degrees_of_freedom, lower.tail = TRUE, log.p = FALSE)

    results <- tibble::tibble(
      estimate = estimate,
      degrees_of_freedom = degrees_of_freedom,
      t = t_data,
      p_value = p_value,
    )
  }

  #right.tail
  if(alternative == "greater"){
    p_value <- pt(t_data, degrees_of_freedom, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      estimate = estimate,
      degrees_of_freedom = degrees_of_freedom,
      t = t_data,
      p_value = p_value,
    )
  }

  #two.tail
  if(alternative == "not_equal"){
    t_data <- abs(t_data)
    p_value <- 2*pt(t_data, degrees_of_freedom, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      estimate = estimate,
      degrees_of_freedom = degrees_of_freedom,
      t = t_data,
      p_value = p_value,
    )
  }



  return(results)
}
