# RHigh
RHigh is an R package designed for high school statistics teachers. It mimics scientific calculator tools to simplify the transition to using R in class. The package makes statistical analysis engaging and accessible for students, enhancing their understanding of statistics and its practical uses.

# Why I built this tool
With the rise of Data Science, Machine Learning, and Artificial Intelligence, we need to rethink how we approach high school statistics courses. Scientific calculators are expensive, cumbersome, unable to handle large datasets, and not used in academia or industry beyond high school. Researchers engage with data and utilize statistical tools using R, Python, or other powerful languages/tools. R has become easy to use and is now accessible to high school students with internet access. Giving students access to R in high school empowers them to explore real-world datasets while learning an increasingly popular tool. 

One barrier to using R in high school is the increased complexity of R compared to popular scientific calculators. This package, RHigh, aims to remove that challenge by offering statistical functions that take on the same form as those commonly found on scientific calculators. The inputs and usage are similar. This allows teachers who are familiar with the statistical functions on scientific calculators to easily transition their curriculum to utilizing R. It also means that statistics textbooks that are written with common scientific calculators in mind will still be effectively usable.

I have used this package with high school students in on-level statistics, AP Statistics, Data Science, and Introduction to Machine Learning courses. After a brief introduction to R, they were able to navigate it quite well. The simplicity of the structure of the RHigh functions helped make the transition to using R in the classroom relatively smooth.

# What functions are currently in the RHigh package?

Right now, the package contains functions that generate basic confidence intervals and perform basic hypothesis tests. I will continue to add more functions, and any suggestions or collaboration are welcome.

Below are the current functions that are available in the package.
* Confidence intervals
  * One proportion z interval
  * Two proportion z interval
  * T interval
  * Two sample t interval
* Hypothesis tests
  * One proportion z-test
  * Two proportion z-test
  * One sample t-test
  * Two sample t-test
  * Chi-square test of independence
 
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
  
