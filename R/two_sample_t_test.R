#' Performs a Two Sample T-Test
#'
#' This function implements a Two Sample T-Test, a statistical hypothesis test used to determine
#' whether the means of two independent samples differ significantly. It tests the null hypothesis
#' that the two populations have identical mean values. The test assumes that the data follows a
#' normal distribution and that the samples are independent and random. The function calculates the
#' test statistic and the p-value. The test statistic follows a t-distribution under the null hypothesis.
#' The p-value represents the probability that a t-statistic as extreme as the observed one could occur
#' by chance if the null hypothesis were true.
#'
#' @param variable1 A numeric vector of data values for the first sample.
#' @param variable2 A numeric vector of data values for the second sample.
#' @param alternative The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".
#' @return A list containing the test statistic and the p-value.
#' @examples
#' \dontrun{
#' two_sample_t_test(c(1,2,3,4,5,6,7,8,9,10), c(2,4,6,8,10), "not_equal")
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd

two_sample_t_test <- function(variable1, variable2, alternative) {

  difference <- mean(variable1, na.rm = TRUE) - mean(variable2, na.rm = TRUE)
  n1 <- length(na.omit(variable1))
  n2 <- length(na.omit(variable2))
  degrees_of_freedom <- min(n1 - 1, n2 - 1)
  t_data <- difference/sqrt( ((sd(variable1, na.rm = TRUE)^2)/n1) + ((sd(variable2, na.rm = TRUE)^2)/n2) )

  #In pt the parameter lower.tail is set to false in order to
  #capture area from the right instead of from the left. P(variable > input)

  #left.tail
  if(alternative == "less"){
    p_value <- pt(t_data, degrees_of_freedom, lower.tail = TRUE, log.p = FALSE)

    results <- tibble::tibble(
      difference = difference,
      degrees_of_freedom = degrees_of_freedom,
      t = t_data,
      p_value = p_value,
    )
  }

  #right.tail
  if(alternative == "greater"){
    p_value <- pt(t_data, degrees_of_freedom, lower.tail = FALSE, log.p = FALSE)

    results <- tibble::tibble(
      difference = difference,
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
      difference = difference,
      degrees_of_freedom = degrees_of_freedom,
      t = t_data,
      p_value = p_value,
    )
  }



  return(results)
}
