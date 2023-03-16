# library(testthat)
test_that(desc = "Test `time_diff_print()`",
          code = {
            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 10:00:00")
              ),
              expected = "Time elapsed: 1.00 days"
            )

            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 10:00:00"),
                digits = 0
              ),
              expected = "Time elapsed: 1 days"
            )

            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 12:12:34"),
                digits = 5,
                decimal_separator = ",",
                prefix_time_elapsed = ""
              ),
              expected = "1,09206 days"
            )

            expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 12:12:34"),
                iteration = "12",
                iterations = "100",
                digits = 1,
                decimal_separator = ",",
                prefix_time_elapsed = "TIME ELAPSED: ",
                prefix_time_remaining = "TIME REMAINING: ",
                prefix_iteration = "ITERATION: ",
                prefix_eta = "ETAAAAA: ",
                eta = FALSE
              ),
              expected = "ITERATION: 12 of 100 (12,0 %), TIME ELAPSED: 1,1 days (TIME REMAINING: ~ 8,0 days)"
            )

            testthat::expect_true(object = {
              res <- time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-01 10:30:00"),
                iteration = "9",
                iterations = "10",
                digits = 1
              )
              all(
                startsWith(
                  res,
                  "Iteration 9 of 10 (90.0 %), Time elapsed: 30.0 mins (Remaining: ~ 3.3 mins, ETA: ~ "
                ),
                endsWith(res, " UTC)")
              )
            })

            ## Without remaining time but with ETA:
            testthat::expect_true(object = {
              res <- time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-03-02 10:50:00"),
                iteration = "9",
                iterations = "10",
                digits = 1,
                remaining_time = FALSE
              )
              all(
                startsWith(res,
                           "Iteration 9 of 10 (90.0 %), Time elapsed: 60.0 days (ETA: ~ "),
                !grepl(
                  pattern = "Remaining",
                  x = res,
                  ignore.case = TRUE
                ),
                grepl(
                  pattern = "ETA",
                  x = res,
                  ignore.case = TRUE
                ),
                endsWith(res, " UTC)")
              )
            })

            ## With remaining time but without ETA:
            testthat::expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 11:20:00"),
                iteration = "9",
                iterations = "10",
                digits = 1,
                eta = FALSE
              ),
              expected = "Iteration 9 of 10 (90.0 %), Time elapsed: 1.1 days (Remaining: ~ 0.1 days)"
            )


            ## Without remaining time and without ETA:
            testthat::expect_equal(
              object = time_diff_print(
                older_timestamp = as.POSIXct("2023-01-01 10:00:00"),
                newer_timestamp = as.POSIXct("2023-01-02 09:20:00"),
                iteration = "9",
                iterations = "10",
                digits = 1,
                remaining_time = FALSE,
                eta = FALSE
              ),
              expected = "Iteration 9 of 10 (90.0 %), Time elapsed: 23.3 hours"
            )

          })
