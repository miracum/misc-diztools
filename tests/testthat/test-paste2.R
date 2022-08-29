test_that(desc = "Test `paste2()`",
          code = {
            expect_equal(object = paste2(
              c("cat", "mouse", "dog"),
              collapse = ", ",
              collapse_last = " and "
            ),
            expected = "cat, mouse and dog")


            expect_equal(object = paste2(
              c("cat", "mouse", "dog"),
              collapse = " - ",
              collapse_last = " and no "
            ),
            expected = "cat - mouse and no dog")

            ## Argument `collapse_last` should be ignored:
            expect_equal(
              object = paste2(
                "cat",
                "mouse",
                "dog",
                collapse_last = " and no ",
                sep = "SEP"
              ),
              expected = paste("cat", "mouse", "dog", sep = "SEP")
            )


            expect_equal(
              object = paste2(
                "cat",
                "mouse",
                "dog",
                sep = "SEP",
                collapse = "; ",
                collapse_last = ". Also "
              ),
              expected = paste("cat", "mouse", "dog", sep = "SEP")
            )



          })
