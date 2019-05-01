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
