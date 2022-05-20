test_that(desc = "Test `get_current_timestamp()`",
          code = {

            ## Default parameters:
            expect_equal(
              object = get_current_timestamp(),
              expected = get_current_timestamp(no_spaces = FALSE)
            )

            ## Number of characters:
            expect_equal(object = nchar(get_current_timestamp(no_spaces = FALSE)),
                         expected = 24)
            expect_equal(object = nchar(get_current_timestamp(no_spaces = TRUE)),
                         expected = 17)

            ## No spaces:
            expect_false(object = grepl(
              pattern = " ",
              x = get_current_timestamp(no_spaces = TRUE),
              fixed = TRUE
            ))


          })
