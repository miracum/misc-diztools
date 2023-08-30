# library(testthat)
test_that(desc = "Test `paste_pct_sum()`",
          code = {
            testthat::expect_equal(object = paste_pct_sum(x = .15,
                                                          pct_ref = 2),
                                   expected = "7.50% (0.15 of 2)")


            testthat::expect_equal(
              object = paste_pct_sum(
                x = .23,
                pct_ref = 12,
                with_percent_sign = TRUE,
                with_absolute = TRUE,
                decimal_separator = ".",
                digits = 2
              ),
              expected = "1.92% (0.23 of 12)"
            )


            testthat::expect_equal(
              object = paste_pct_sum(
                x = 34,
                pct_ref = 2,
                with_percent_sign = FALSE,
                with_absolute = TRUE,
                decimal_separator = ",",
                digits = 4
              ),
              expected = "1700,0000 (34 of 2)"
            )

            testthat::expect_equal(
              object = paste_pct_sum(
                x = 85,
                pct_ref = 3242,
                with_absolute = FALSE,
                digits = 4
              ),
              expected = "2.6218%"
            )

          })
