# DIZtools - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2023 Universitätsklinikum Erlangen, Germany
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

#' @title Round numbers without problems.
#' @description Round numbers without problems.
#' @param x (numeric) The numeric input vector to round.
#' @param digits (int, optional) The number of digits after the decimal
#'   separator to round to.
#' @param thousands_separator (string, optional) Used as mark between every 3
#'   decimals before the decimal point.
#' @param decimal_separator (string, optional) The character to be used to
#'   indicate the numeric decimal point.
#' @param lower_indicator (Boolaen, optional, default = TRUE) If the result is
#'   (since it is rounded) zero: Should there be displayed a lower-indicator?
#'   E.g. \code{DIZtools::robust_round(0.00001)} results internally in "0.00".
#'   The more intuitive result therefore would be "<0.01", which can be enabled
#'   using the parameter `lower_indicator == TRUE`.
#' @return Rounded numbers as string.
#' @examples{
#'   robust_round(c(1.234567, 987123.987654321))
#'   #> [1] "1.23"   "987.99"
#' }
#' @export
#'
robust_round <- function(x,
                         digits = 2,
                         thousands_separator = "",
                         decimal_separator = ".",
                         lower_indicator = TRUE) {
  stopifnot(
    "The `digits` argument must be an integer >= 0" =
      is.numeric(digits) && digits >= 0,
    "The `lower_indicator` must be TRUE or FALSE" =
      is.logical(lower_indicator)
  )

  res <- round(x, digits = digits) |>
    format(
      nsmall = digits,
      trim = TRUE,
      big.mark = thousands_separator,
      decimal.mark = decimal_separator
    )

  if (lower_indicator) {
    return(sapply(res, function(x) {
      ## Remove thousands- and decimal-separator:
      x_tmp <- x

      if (thousands_separator != "") {
        x_tmp <- gsub(
          pattern = thousands_separator,
          replacement = "",
          x = x_tmp,
          fixed = TRUE
        )
      }

      if (decimal_separator != "") {
        x_tmp <- gsub(
          pattern = decimal_separator,
          replacement = "",
          x = x_tmp,
          fixed = TRUE
        )
      }

      if (x_tmp |> as.numeric() == 0) {
        ## Rounded value would be zero, so return "<0.00" instead:

        if (digits == 0) {
          return("<1")
        } else {
          return(paste0(
            "<0",
            decimal_separator,
            paste(rep(0, digits - 1), collapse = ""),
            "1"
          ))
        }
      } else {
        return(x)
      }
    }) |> unname())
  }

  return(res)
}
