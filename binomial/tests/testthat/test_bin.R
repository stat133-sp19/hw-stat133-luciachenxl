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
