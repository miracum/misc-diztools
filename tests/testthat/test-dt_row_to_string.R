# library(testthat)
test_that(desc = "Test `dt_row_to_string()`",
          code = {
            dt <- data.table::data.table(
              name = c("Alice", "Bob"),
              dob = c(as.POSIXct("1980-01-01"), as.POSIXct("1981-12-31")),
              sex = c("f", "m")
            )

            testthat::expect_equal(object = dt |> DIZtools::dt_row_to_string(),
                                   expected = "name: 'Alice', dob: '1980-01-01', sex: 'f'")


            testthat::expect_equal(object = dt |> DIZtools::dt_row_to_string(row = 2),
                                   expected = "name: 'Bob', dob: '1981-12-31', sex: 'm'")

            testthat::expect_equal(
              object = dt |> DIZtools::dt_row_to_string(
                row = 2,
                sep = " | ",
                collapse = " --> ",
                quote = ""
              ),
              expected = "name --> Bob | dob --> 1981-12-31 | sex --> m"
            )

          })
