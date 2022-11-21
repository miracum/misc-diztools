test_that(desc = "Test `robust_round()`",
          code = {
            expect_equal(object = robust_round(x = 123456.123456789),
                         expected = "123456.12")

            expect_equal(object = robust_round(x = 123456.987654321),
                         expected = "123456.99")

            expect_equal(object = robust_round(x = 123456.123456789, digits = 0),
                         expected = "123456")

            expect_equal(object = robust_round(x = 123456.987654321, digits = 0),
                         expected = "123457")

            expect_equal(
              object = robust_round(
                x = 123456.123456789,
                digits = 0,
                decimal_separator = ","
              ),
              expected = "123456"
            )

            expect_equal(
              object = robust_round(
                x = 123456.987654321,
                digits = 0,
                decimal_separator = ","
              ),
              expected = "123457"
            )

            expect_equal(
              object = robust_round(
                x = 123456.123456789,
                digits = 3,
                thousands_separator = ".",
                decimal_separator = ","
              ),
              expected = "123.456,123"
            )

            expect_equal(
              object = robust_round(
                x = 123456.987654321,
                digits = 3,
                thousands_separator = ".",
                decimal_separator = ","
              ),
              expected = "123.456,988"
            )

            expect_equal(
              object = robust_round(
                x = c(123456.987654321, 123456.123456789),
                digits = 3,
                thousands_separator = ".",
                decimal_separator = ","
              ),
              expected = c("123.456,988", "123.456,123")
            )


          })
