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
#' @return Rounded numbers as string.
#' @examples{
#'   robust_round(c(1.234567, 987123.987654321))
#'   #> [1] "1.23"   "987.99"
#' }
#' @export
#'
robust_round <-
  function(x,
           digits = 2,
           thousands_separator = "",
           decimal_separator = ".") {
    return(round(x, digits = digits) |> format(
      nsmall = digits,
      trim = TRUE,
      big.mark = thousands_separator,
      decimal.mark = decimal_separator
    ))
  }
