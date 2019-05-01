context("Check checkers")

test_that("check_prob with an ok prob",{
  expect_true(check_prob(0.5))
  expect_error(check_prob(c(1,2)))
  expect_error(check_prob(2))
  expect_error(check_prob(-1))
})

test_that("check_trials with an ok trials",{
  expect_true(check_trials(2))
  expect_error(check_trials(c(1,2)))
  expect_error(check_trials(2.3))
  expect_error(check_trials(-2))
})

test_that("check_success with an ok success",{
  expect_true(check_success(1:3,4))
  expect_error(check_success(2.5,3))
  expect_error(check_success(-2,2))
})

context("Check summary methods")

test_that("aux_mean with ok input and output",{
  expect_equal(aux_mean(3,0.5),1.5)
  expect_equal(aux_mean(3,0.7),2.1)
  expect_error(aux_mean(abc))
})

test_that("aux_variance with ok input and output",{
  expect_equal(aux_variance(2,0.5),0.5)
  expect_error(aux_variance(abc))
  expect_true(aux_variance(2,0.5)==0.5)
})

test_that("aux_mode with an ok input and output",{
  expect_true(aux_mode(1,.4)-as.integer(aux_mode(1,.4))==0)
  expect_equal(aux_mode(2,0.4),1)
  expect_length(aux_mode(5,0.5),2)
})

test_that("aux_skewness with an ok result",{
  expect_equal(aux_skewness(1,0.5),0)
  expect_length(aux_skewness(2,.5),1)
  expect_error(aux_skewness(abc))
})

test_that("aux_kurtosis with an ok result",{
  expect_equal(aux_kurtosis(1,0.5),-2)
  expect_length(aux_kurtosis(2,.5),1)
  expect_error(aux_kurtosis("a"))
})

context("check binomial")

test_that("bin_choose with ok n,k and result",{
  expect_equal(bin_choose(5,2),10)
  expect_error(bin_choose(2,5))
  expect_length(bin_choose(2,1:2),2)
  expect_true(sum(bin_choose(2,1:2)==c(2,1))==2)
})

test_that("bin_probability with ok input and output",{
  expect_error(bin_probability(5,2,0.5))
  expect_error(bin_probability(-1,2,0.1))
  expect_equal(bin_probability(2,5,0.5),10*0.5^5)
})

test_that("bin_distribution with ok input and output",{
  expect_error(bin_distribution(-1,0.5))
  expect_length(class(bin_distribution(5,.5)),2)
  expect_error(bin_distribution(5,2))
})

test_that("bin_cumulative with ok input and output",{
  expect_error(bin_cumulative(-1,0.5))
  expect_length(class(bin_cumulative(5,.5)),2)
  expect_error(bin_cumulative(5,2))
})
