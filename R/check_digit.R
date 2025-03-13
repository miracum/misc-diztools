# DIZtools - Utilities for 'DIZ' R Package Development
# Copyright (c) 2020-2025 Universitätsklinikum Erlangen, Germany
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


#' @title Calculate Check Digit Using DIN/ISO 7064, Mod 11,10
#'
#' @description This function calculates the check digit for a given ID
#'   based on the DIN ISO 7064, Mod 11,10 algorithm.
#'
#' @param patid A numeric or character string representing the ID.
#'   It should be either 9 or 10 digits long.
#'
#' @return An integer representing the computed check digit (0-9).
#'   Returns `NA` if the input is invalid.
#'
#' @details
#' The function processes the input `patid` as follows:
#' - If the input has 10 digits and does not start with `0`,
#'   it is assumed to be a patient ID with a check digit. The check digit is removed.
#' - If the input has 9 digits, a leading `0` is added.
#' - If the input has 10 digits and starts with `0`, it is already in the expected format.
#' - If the input does not match these cases, an error message is returned.
#'
#' The check digit is calculated using the ISO 7064, Mod 11,10 method.
#'
#' @examples
#' calculate_check_digit("100000138")  # Returns check digit (1) for this ID
#' calculate_check_digit(123456789)    # Works with numeric input as well (6)
#'
#' @export
#'
calculate_check_digit <- function(patid) {
  patid <- as.character(patid)
  N <- nchar(patid)
  a <- strsplit(x = patid, split = "")[[1]]

  if (N == 10 && a[[1]] != 0) {
    ## 10 digits, no leading 0: This is the normal case
    ## (9 digits pat-id + 1 check digit). So remove the check digit and
    ## add the leading 0:
    a <- c("0", a[1:9])
  } else if (N == 10 && a[[1]] == 0) {
    ## 10 digits, WITH leading 0: This is old pat-id with leading 0. Perfect.
    # a <- a
  } else if (N == 9) {
    ## Only the pat-id without leading zero and without check digit.
    ## So add the leading zero:
    a <- c("0", a)
  } else {
    DIZtools::feedback(
      print_this = paste0(
        "Can't handle the input '",
        patid,
        "'. N_digits = ",
        N,
        " Exiting."
      ),
      type = "Error",
      findme = "5a835920a9"
    )
    return(NA)
  }
  if (length(a) != 10) {
    DIZtools::feedback(
      print_this = paste0(
        "Length of patid must be 10 but currently is '",
        a,
        "'. N_digits = ",
        N,
        " Exiting."
      ),
      type = "Error",
      findme = "ad4add0547"
    )
    return(NA)
  }

  a <- paste(a, collapse = "")

  P <- 10
  N <- nchar(a)

  for (J in 1:N) {
    P <- P + as.integer(substr(a, J, J))

    if (P > 10) {
      P <- P - 10
    }

    P <- P * 2

    if (P >= 11) {
      P <- P - 11
    }
  }
  P <- 11 - P

  if (P == 10) {
    P <- 0
  }

  return(P)
}


#' @title Validate an ID Using the Check Digit (DIN ISO 7064, Mod 11,10)
#'
#' @description This function verifies whether a given ID is valid by checking
#'   its check digit using the DIN ISO 7064, Mod 11,10 algorithm.
#'
#' @param test A numeric or character string representing the ID.
#'   It should be exactly 10 digits long, including the check digit.
#'
#' @return A logical value: `TRUE` if the check digit is correct, `FALSE` otherwise.
#'   Returns `FALSE` with an error message if the input format is invalid.
#'
#' @details
#' The function processes the input as follows:
#' - If the input has 10 digits and does not start with `0`,
#'   it is assumed to be a ID with a check digit.
#' - If the input has 10 digits and starts with `0`, it is considered an old
#'   ID without a check digit, and validation cannot be performed.
#' - If the input has 9 digits, it lacks a check digit, so validation is not possible.
#' - If the input format is invalid, an error message is generated.
#'
#' The function extracts the main ID (without the check digit), computes the
#' expected check digit using `calculate_check_digit()`, and compares it with
#' the provided check digit.
#'
#' @examples
#' test_check_digit("1000001381")  # Returns TRUE if the check digit is correct
#' test_check_digit("1000001121")  # Another valid ID
#' test_check_digit("1007002482")  # Returns FALSE if the check digit is incorrect
#'
#' @export
test_check_digit <- function(test) {
  test <- as.character(test)
  N <- nchar(test)
  a <- strsplit(x = test, split = "")[[1]]
  a <- as.numeric(a)

  if (N == 10 && a[[1]] != 0) {
    ## 10 digits, no leading 0: This is the normal case
    ## (9 digits pat-id + 1 check digit)
    patid <- a[1:9]
  } else if (N == 10 && a[[1]] == 0) {
    ## 10 digits, WITH leading 0: This is old pat-id with leading 0
    ## but without check digit. So we can't check anything. Exit.
    DIZtools::feedback(
      print_this = paste0(
        "The number provided has 10 digits and",
        " a leading 0. So there is no check digit",
        " to check. Exiting."
      ),
      type = "Error",
      findme = "2b47588f9e"
    )
    return(FALSE)
  } else if (N == 9) {
    DIZtools::feedback(
      print_this = paste0(
        "The number provided has 9 digits and",
        " therefore no check digit to check. Exiting."
      ),
      type = "Error",
      findme = "6328c05b0e"
    )
    return(FALSE)
  } else {
    DIZtools::feedback(
      print_this = paste0("Can't handle the input. N_digits = ", N, " Exiting."),
      type = "Error",
      findme = "bd422710e0"
    )
    return(FALSE)
  }

  check_digit <- calculate_check_digit(paste(patid, collapse = ""))
  if (check_digit == a[[10]]) {
    return(TRUE)
  } else {
    DIZtools::feedback(
      print_this = paste0("The correct check digit is '", check_digit, "'"),
      findme = "eeab0b9a71"
    )
    return(FALSE)
  }
}
