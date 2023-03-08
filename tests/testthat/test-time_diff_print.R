# library(testthat)
test_that(desc = "Test `time_diff_print()`",
          code = {
            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 10:00:00")
              ),
              expected = "1.00 days"
            )

            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 10:00:00"),
                digits = 0
              ),
              expected = "1 days"
            )

            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 12:12:34"),
                digits = 5,
                decimal_separator = ","
              ),
              expected = "1,09206 days"
            )

          })
