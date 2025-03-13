# library(testthat)
test_that(desc = "Test `test_check_digit()`", code = {
  testthat::expect_equal(object = calculate_check_digit(101936293), expected = 8)
  testthat::expect_equal(object = calculate_check_digit(101555089), expected = 0)
  testthat::expect_equal(object = calculate_check_digit(0101555089), expected = 0)
})

test_that(desc = "Test `test_check_digit()`", code = {
  ## valid:
  testthat::expect_true(test_check_digit(1000001381))
  testthat::expect_true(test_check_digit(1000001121))
  testthat::expect_true(test_check_digit(1000001839))
  testthat::expect_true(test_check_digit(1019362938))
  testthat::expect_true(test_check_digit(1015550890))

  ## invalid:
  testthat::expect_false(test_check_digit(1007002482))  ## 0 is correct
})
