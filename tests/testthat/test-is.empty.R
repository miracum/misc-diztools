test_that(desc = "Test `is.empty`",
          code = {
            ## TRUE:
            expect_equal(is.empty(NULL), expected = TRUE)
            expect_equal(is.empty(c()), expected = TRUE)
            expect_equal(is.empty(NA), expected = TRUE)
            expect_equal(is.empty(NaN), expected = TRUE)
            expect_equal(is.empty(""), expected = TRUE)
            expect_equal(is.empty(0), expected = TRUE)
            expect_equal(is.empty(0.00), expected = TRUE)
            expect_equal(is.empty("    "), expected = TRUE)


            ## FALSE:
            expect_equal(is.empty("foobar"), expected = FALSE)
            expect_equal(is.empty("    ", trim = FALSE), expected = FALSE)

            ## is.empty is vectorised!
            expect_equal(all(is.empty(rep("", 10))), expected = TRUE)
            expect_equal(all(is.empty(matrix(NA, 10, 10))), expected = TRUE)
            expect_equal(all(unlist(is.empty(
              list(
                a = NULL,
                b = NA,
                c = c(),
                d = list(a2 = NULL, b2 = NA, c2 = " ")
              )
            ))), expected = TRUE)

            expect_equal(all(unlist(is.empty(
              list(
                a = NULL,
                b = NA,
                c = c(),
                d = list(a2 = NULL, b2 = NA, c2 = " ")
              ), trim = FALSE
            ))), expected = FALSE)

            expect_equal(all(unlist(is.empty(
              list(
                a = NULL,
                b = NA,
                c = c(),
                d = list(a2 = NULL)
              )
            ))), expected = TRUE)

            expect_equal(is.empty(
              list(
                a = NULL,
                b = NA,
                c = c(),
                d = list(a2 = NULL, b2 = NA, c2 = " ")
              ),
              trim = TRUE,
              all = TRUE
            ), expected = TRUE)

            expect_equal(is.empty(
              list(
                a = NULL,
                b = NA,
                c = c(),
                d = list(a2 = NULL, b2 = NA, c2 = " ")
              ),
              trim = FALSE,
              all = TRUE
            ), expected = FALSE)

            x <- list(
              a = NULL,
              b = NA,
              c = c(),
              d = list(a2 = NULL, b2 = NA, c2 = " ")
            )
            expect_equal(object = is.empty(x, trim = FALSE, all = TRUE),
                         expected = all(unlist(is.empty(x, trim = FALSE))))

            expect_length(object = is.empty(x), n = 4)
            expect_length(object = is.empty(x, all = TRUE), n = 1)

          })

# is.empty(
#   list(
#     a = NULL,
#     b = NA,
#     c = c(),
#     d = list(a2 = NULL, b2 = NA, c2 = " ")
#   ), trim = TRUE, all = TRUE
# )
