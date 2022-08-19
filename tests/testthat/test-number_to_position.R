test_that(desc = "Test `number_to_position()`",
          code = {
            ## 1-34:
            input <- c(1:34)
            output <- c("1st",
                        "2nd",
                        "3rd",
                        paste0(4:20, "th"),
                        "21st",
                        "22nd",
                        "23rd",
                        paste0(24:30, "th"),
                        "31st",
                        "32nd",
                        "33rd",
                        "34th")
            expect_equal(object = number_to_position(input), expected = output)


            ## 99-134:
            input <- c(99:134)
            output <- c(
              "99th",
              "100th",
              "101st",
              "102nd",
              "103rd",
              ## Note that *11, *12 and *13 still need to have the suffix "th"
              ## not "st", "nd" or "rd":
              paste0(104:120, "th"),
              "121st",
              "122nd",
              "123rd",
              paste0(124:130, "th"),
              "131st",
              "132nd",
              "133rd",
              "134th"
            )
            expect_equal(object = number_to_position(input), expected = output)


            ## Higher stuff:
            input <- c(123409:123425)
            output <- c(
              paste0(123409:123420, "th"),
              "123421st",
              "123422nd",
              "123423rd",
              paste0(123424:123425, "th")
            )
            expect_equal(object = number_to_position(input), expected = output)


          })
