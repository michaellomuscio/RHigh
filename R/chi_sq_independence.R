#' Performs a Chi Square Test for Independence
#'
#' This function implements a Chi Square Test for Independence, a statistical hypothesis test used to
#' determine whether there is a significant association between two categorical variables in a sample.
#' The test compares the observed distribution of frequencies in the sample with the distribution that
#' would be expected if the variables were independent. The function calculates the test statistic and
#' the p-value. The test statistic follows a chi square distribution under the null hypothesis. The
#' p-value represents the probability that a chi square statistic as extreme as the observed one could
#' occur by chance if the null hypothesis were true.
#'
#' @param variable1 The first categorical variable.
#' @param variable2 The second categorical variable.
#' @return A list containing the test statistic, the degrees of freedom, the p-value, a table of observed values, and a table of expected values.
#' @examples
#' \dontrun{
#' chi_sq_independence(dataSet$variable1, dataSet$variable2)
#' }
#' @importFrom stats na.omit pchisq pnorm pt qnorm qt sd


chi_sq_independence <- function(variable1, variable2) {

  observed_values <- table(variable1, variable2)


  row.sums <- apply(na.omit(observed_values), 1, sum)
  col.sums <- apply(na.omit(observed_values), 2, sum)
  total.sum <- sum(row.sums)

  nrows <- nrow(na.omit(observed_values))
  ncols <-ncol(na.omit(observed_values))

  degrees_of_freedom <- (nrows - 1)*(ncols - 1)
  chi_sq <- c()
  expected_values <- c()

  for(i in 1:nrows){
    for(j in 1:ncols){
      observed <- na.omit(observed_values)[i,j]
      expected <- (row.sums[[i]]*col.sums[[j]])/total.sum
      expected_values <- rbind(expected_values, expected)
      chi_sq <- rbind(chi_sq, (((observed - expected)^2)/expected))
    }
  }

  chi_sq <- sum(chi_sq)
  p_value <- pchisq(chi_sq, degrees_of_freedom, ncp = 0, lower.tail = FALSE, log.p = FALSE)

  results <- tibble::tibble(
    chi_sq = chi_sq,
    degrees_of_freedom = degrees_of_freedom,
    p_value = p_value,
  )

  expected_values <- matrix(expected_values, ncol=ncols, byrow=TRUE)
  colnames(expected_values) <- colnames(observed_values)
  rownames(expected_values) <- rownames(observed_values)
  expected_values <- as.table(expected_values)

  output <- list("results" = results, "observed_values" = observed_values, "expected_values" = expected_values)
  #output <- list("results" = results)

  return(output)
}
