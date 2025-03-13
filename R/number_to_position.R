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

#' @title Converts an integer number to its "verbal position".
#'   1 --> "1st", 2 --> "2nd", 3 --> "3rd", 4 --> "4th", ...
#' @description Converts an integer number to its "verbal position".
#'   1 --> "1st", 2 --> "2nd", 3 --> "3rd", 4 --> "4th", ...
#'
#' @param x A number.
#' @return Returns the input number as string with a new suffix depending on
#'  the numbers position in the numbers bar.
#' @examples{
#'
#' }
#' @export
#'
number_to_position <- function(x) {
  return(sapply(x, function(y) {
    y <- as.numeric(y)
    last_digit <-
      as.numeric(substr(
        x = y,
        start = nchar(y),
        stop = nchar(y)
      ))
    last_two_digits <-
      as.numeric(substr(
        x = y,
        start = nchar(y) - 1,
        stop = nchar(y)
      ))

    if (last_digit == 1 &&
        last_two_digits != 11) {
      suffix <- "st"
    } else if (last_digit == 2 && last_two_digits != 12) {
      suffix <- "nd"
    } else if (last_digit == 3 && last_two_digits != 13) {
      suffix <- "rd"
    } else {
      suffix <- "th"
    }
    return(paste0(y, suffix))
  }))
}
