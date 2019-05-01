Overview
--------

`"cointoss"` is a minimal [R](http://www.r-project.org/) package that
provides functions to simulate tossing a coin.

\*`"bin_distribution()"` creates a data frame showing the distribution
of probability different number of successes in certain number of trials
can be displayed.

\*`"bin_cumulative()"` creates a data frame showing the distribution of
cumulative probability ofdifferent number of successes in certain number
of trials can be displayed.

\*`"bin_variable()"` exams the summary of the variables and measures.

\*there are some function to calculate the measures:

the expected value: `"bin_mean()"`

the variance: `"bin_variance()"`

the mode: `"bin_mode()"`

the skewness: `"bin_skewness()"`

the kurtosis: `"bin_kurtosis"`

Motivation
----------

This package has been developed to illustrate some of the concepts
behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package
`"devtools"`:

    # development version from GitHub:
    #install.packages("devtools") 
    # install "cointoss" (without vignettes)
    devtools::install_github("luciachenxl/binomial")
    # install "cointoss" (with vignettes)
    devtools::install_github("luciachenxl/binomial", build_vignettes = TRUE)

Usage
-----

    library(binomial)

    # probability of getting 2 successes in 5 trials
    #(assuming prob of success = 0.5)
    bin_probability(success = 2, trials = 5, prob = 0.5)
    #> [1] 0.3125

    #binomial probability distribution
    dis<-bin_distribution(trials = 5, prob = 0.5)
    dis
    #>   success probability
    #> 1       0     0.03125
    #> 2       1     0.15625
    #> 3       2     0.31250
    #> 4       3     0.31250
    #> 5       4     0.15625
    #> 6       5     0.03125

    #plot the distribution
    plot(dis)

![](README-unnamed-chunk-3-1.png)


    #cumulative binomial probability distribution
    dis<-bin_cumulative(trials = 5, prob = 0.5)
    dis
    #>   success probability cumulative
    #> 1       0     0.03125    0.03125
    #> 2       1     0.15625    0.18750
    #> 3       2     0.31250    0.50000
    #> 4       3     0.31250    0.81250
    #> 5       4     0.15625    0.96875
    #> 6       5     0.03125    1.00000

    #plot the cumulative distribution
    plot(dis)

![](README-unnamed-chunk-3-2.png)


    #summary of the variables and measures 
    bin1 <- bin_variable(trials = 10, p = 0.3)
    bin1
    #> [1] "Binomial variable"
    #> [1] ""
    #> [1] "Paramaters"
    #> [1] "- number of trials:10"
    #> [1] "- prob of success:0.3"
    binsum1 <- summary(bin1)
    binsum1
    #> [1] "Summary Binomial"
    #> [1] ""
    #> [1] "Paramaters"
    #> [1] "- number of trials:10"
    #> [1] "- prob of success:0.3"
    #> [1] ""
    #> [1] "Measures"
    #> [1] ""
    #> [1] "- mean:3"
    #> [1] "- variance:2.1"
    #> [1] "- mode:3"
    #> [1] "- skewness:0.276026223736942"
    #> [1] "- kurtosis:-0.123809523809524"
