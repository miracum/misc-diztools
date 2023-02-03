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

#' @title Calculate time difference of two timestamps, round the value and
#'   return a string with suiting unit.
#' @description Create string with time difference in suitable unit.
#' @param older_timestamp (POSIXct) Start time.
#' @param newer_timestamp (POSIXct) End time.
#' @inheritParams robust_round
#' @return A list with one element per row of the input file
#' @export
#'
time_diff_print = function(older_timestamp,
                           newer_timestamp,
                           digits = 2,
                           thousands_separator = "",
                           decimal_separator = ".") {
  older_timestamp <- as.POSIXct(older_timestamp)
  newer_timestamp <- as.POSIXct(newer_timestamp)

  time_diff <-
    difftime(time1 = newer_timestamp,
             time2 = older_timestamp,
             units = "auto")
  res <-
    paste0(
      robust_round(
        as.numeric(time_diff),
        digits = digits,
        thousands_separator = thousands_separator,
        decimal_separator = decimal_separator
      ),
      " ",
      attributes(time_diff)[["units"]]
    )
  return(res)
}
