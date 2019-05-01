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
