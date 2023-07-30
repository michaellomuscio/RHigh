<center><img src="https://github.com/michaellomuscio/RHigh/assets/49921701/00fafcbe-5c6f-42fc-9348-ac535ab3b198" alt="RHigh" width="200"/></center>

# RHigh
RHigh is an R package designed for high school statistics teachers. It mimics scientific calculator tools to simplify the transition to using R in class. The package makes statistical analysis engaging and accessible for students, enhancing their understanding of statistics and its practical uses.

# Why I built this tool
With the rise of Data Science, Machine Learning, and Artificial Intelligence, we need to rethink how we approach high school statistics courses. Scientific calculators are expensive, cumbersome, unable to handle large datasets, and not used in academia or industry beyond high school. Researchers engage with data and utilize statistical tools using R, Python, or other powerful languages/tools. R has become easy to use and is now accessible to high school students with internet access. Giving students access to R in high school empowers them to explore real-world datasets while learning an increasingly popular tool. 

One barrier to using R in high school is the increased complexity of R compared to popular scientific calculators. This package, RHigh, aims to remove that challenge by offering statistical functions that take on the same form as those commonly found on scientific calculators. The inputs and usage are similar. This allows teachers who are familiar with the statistical functions on scientific calculators to easily transition their curriculum to utilizing R. It also means that statistics textbooks that are written with common scientific calculators in mind will still be effectively usable.

I have used this package with high school students in on-level statistics, AP Statistics, Data Science, and Introduction to Machine Learning courses. After a brief introduction to R, they were able to navigate it quite well. The simplicity of the structure of the RHigh functions helped make the transition to using R in the classroom relatively smooth.

# How to install the package
I am working on getting the package added to CRAN. In the meantime, you can use the package by downloading the package file ____ and then directly installing and loading it in R. Here are the steps broken down.
1. Download this file [RHigh_0.0.0.9000.tar](https://github.com/michaellomuscio/RHigh/blob/main/RHigh_0.0.0.9000.tar.gz)
2. In R, run this command to install the package `install.packages("path-to-saved-file/RHigh_0.0.0.9000.tar.gz", repos = NULL)`
3. In R, run this command to load the package `library(RHigh)`

Once you follow these steps, the package will be loaded, and you can begin calling and utilizing the RHigh functions.

# What functions are currently in the RHigh package?

Right now, the package contains functions that generate basic confidence intervals and perform basic hypothesis tests. I will continue to add more functions, and any suggestions or collaboration are welcome.

Below are the current functions that are available in the package.
* Confidence intervals
  * [One proportion z interval](#one-proportion-z-interval)
  * [Two proportion z interval](#two-proportion-z-interval)
  * [T interval](#t-interval)
  * [Two sample t interval](#two-sample-t-interval)
* Hypothesis tests
  * [One proportion z test](#one-proportion-z-test)
  * [Two proportion z test](#two-proportion-z-test)
  * [One sample t test](#t-test)
  * [Two sample t test](#two-sample-t-test)
  * [Chi-Square test of independence](#chi-square-test-for-independence)
 
Please email me at lomuscio.michael@gmail.com with any suggestions for functions I should include. 

# Examples

## One proportion z interval

Computes a One Proportion Z-Interval

This function calculates a confidence interval for a population proportion using a z-distribution.
The confidence interval provides a range of plausible values for the population proportion based on
the proportion observed in a sample. The width of the confidence interval gives an idea of how
uncertain we are about the unknown population proportion. A wider interval implies more uncertainty.
The function assumes that the data follows a binomial distribution and that the sample is random.

**Parameters**

`one_prop_z_interval(x, n, confidence_level)`

* `x` The number of observed successes in the sample.
* `n` The size of the sample.
* `confidence_level` The confidence level for the interval, often 0.95 is used.

The function returns a list containing the lower and upper bounds of the confidence interval.

**Example**

`one_prop_z_interval(5, 10, 0.95)`

## Two proportion z interval

Computes a Two Proportion Z-Interval

This function calculates a confidence interval for the difference between two population proportions
using a z-distribution. The confidence interval provides a range of plausible values for the difference
between two population proportions based on the proportions observed in two independent samples.
The width of the confidence interval gives an idea of how uncertain we are about the unknown difference.
A wider interval implies more uncertainty. The function assumes that the data follows a binomial
distribution and that the samples are independent and random.

**Parameters**

`two_prop_z_interval(x1, n1, x2, n2, confidence_level)`

* `x1` The number of observed successes in sample 1.
* `n1` The size of sample 1.
* `x2` The number of observed successes in sample 2.
* `n2` The size of sample 2.
* `confidence_level` The confidence level for the interval, often 0.95 is used.

The function returns a list containing the lower and upper bounds of the confidence interval.

**Example**

`two_prop_z_interval(5, 10, 50, 100, 0.95)`

## T interval

Computes a One Sample T-Interval

This function calculates a confidence interval for a population mean using a t-distribution. The
confidence interval provides a range of plausible values for the population mean based on the mean
observed in a single sample. The width of the confidence interval gives an idea of how uncertain we
are about the unknown population mean. A wider interval implies more uncertainty. The
function assumes that the data follows a normal distribution and that the sample is random.

**Parameters**

`t_interval(variable1, confidence_level)`

* `variable1` A numeric vector of data values.
* `confidence_level` The confidence level for the interval, often 0.95 is used.

The function returns a list containing the lower and upper bounds of the confidence interval.

**Example**

`t_interval(c(1,2,3,4,5), 0.95)`

## Two sample t interval

Computes a Two Sample T-Interval

This function calculates a confidence interval for the difference between two population means
using a t-distribution. The confidence interval provides a range of plausible values for the
difference between two population means based on the means observed in two independent samples.
The width of the confidence interval gives an idea of how uncertain we are about the unknown difference.
A wider interval implies more uncertainty. The function assumes that the data follows a normal
distribution and that the samples are independent and random.

**Parameters**

`two_sample_t_interval(variable1, variable2, confidence_leve)`

* `variable1` A numeric vector of data values for the first sample.
* `variable2` A numeric vector of data values for the second sample.
* `confidence_level` The confidence level for the interval, often 0.95 is used.

The function returns a list containing the lower and upper bounds of the confidence interval.

**Example**

`two_sample_t_interval(c(1,2,3,4,5), c(2,4,6,8,10), 0.95)`

## One proportion z test

Performs a One Proportion Z-Test

This function implements a One Proportion Z-Test, a statistical hypothesis test used to determine
whether the proportion of successes in a single sample differs significantly from a hypothesized
population proportion. The test assumes that the data follows a binomial distribution and that the
sample is random. The function calculates the test statistic and the p-value. The test statistic
follows a standard normal distribution under the null hypothesis. The p-value represents the
probability that a z-statistic as extreme as the observed one could occur by chance if the null
hypothesis were true.

**Parameters**

`one_prop_z_test(x, n, p0, confidence_level)`

* `x` The number of observed success in the sample.
* `n` The size of the sample.
* `p0` The hypothesized population proportion.
* `alternative` The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".

The function returns a list containing the test statistic and the p-value.

**Example**

`one_prop_z_test(5, 10, 0.5, "not_equal")`

## Two proportion z test

Performs a Two Proportion Z-Test

This function implements a Two Proportion Z-Test, a statistical hypothesis test used to determine
whether the proportions of successes in two independent samples differ significantly. The test
assumes that the data follows a binomial distribution and that the samples are independent and random.
The function calculates the test statistic and the p-value. The test statistic follows a standard
normal distribution under the null hypothesis. The p-value represents the probability that a
z-statistic as extreme as the observed one could occur by chance if the null hypothesis were true.


**Parameters**

`two_prop_z_test(x1, n1, x2, n2, alternative)`

* `x1` The number of observed successes in the sample 1.
* `n1` The size of the sample 1.
* `x2` The number of observed successes in the sample 2.
* `n2` The size of the sample 2.
* `alternative` The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".

The function returns a list containing the test statistic and the p-value.

**Example**

`two_prop_z_test(5, 10, 50, 100, "not_equal")`

## T test

Performs a One Sample T-Test

This function implements a One Sample T-Test, which is a statistical hypothesis test used to
determine whether the mean of a sample differs significantly from a hypothesized population mean.
The test assumes that the data follows a normal distribution and that the sample is random.
The function calculates the test statistic and the p-value. The test statistic follows a t-distribution
under the null hypothesis. The p-value represents the probability that a t-statistic as extreme as the
observed one could occur by chance if the null hypothesis were true.


**Parameters**

`t_test(variable1, mu0, alternative)`

* `variable1` A numeric vector of data values.
* `mu0` The hypothesized population mean.
* `alternative` The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".

The function returns a list containing the test statistic and the p-value.

**Example**

`t_test(c(1,2,3,4,5,6,7,8,9,10), 5, "not_equal")`

## Two sample t test

Performs a Two Sample T-Test

This function implements a Two Sample T-Test, a statistical hypothesis test used to determine
whether the means of two independent samples differ significantly. It tests the null hypothesis
that the two populations have identical mean values. The test assumes that the data follows a
normal distribution and that the samples are independent and random. The function calculates the
test statistic and the p-value. The test statistic follows a t-distribution under the null hypothesis.
The p-value represents the probability that a t-statistic as extreme as the observed one could occur
by chance if the null hypothesis were true.


**Parameters**

`two_sample_t_test(variable1, variable2, alternative)`

* `variable1` A numeric vector of data values for the first sample.
* `variable2` A numeric vector of data values for the second sample.
* `alternative` The direction of alternative hypothesized. Values can be "less", "greater", or "not_equal".

The function returns a list containing the test statistic and the p-value.

**Example**

`two_sample_t_test(c(1,2,3,4,5,6,7,8,9,10), c(2,4,6,8,10), "not_equal")`

## Chi-Square test for independence

Performs a Chi Square Test for Independence

This function implements a Chi Square Test for Independence, a statistical hypothesis test used to
determine whether there is a significant association between two categorical variables in a sample.
The test compares the observed distribution of frequencies in the sample with the distribution that
would be expected if the variables were independent. The function calculates the test statistic and
the p-value. The test statistic follows a chi square distribution under the null hypothesis. The
p-value represents the probability that a chi square statistic as extreme as the observed one could
occur by chance if the null hypothesis were true.


**Parameters**

`chi_sq_independence(dataSet$variable1, dataSet$variable2)`

* `variable1` The first categorical variable.
* `variable2` The second categorical variable.

**Note** that variable1 and variable2 need to come from the same dataset.


The function returns a list containing the test statistic, the degrees of freedom, the p-value, a table of observed values, and a table of expected values.

**Example**

`chi_sq_independence(dataSet$variable1, dataSet$variable2)`
  
