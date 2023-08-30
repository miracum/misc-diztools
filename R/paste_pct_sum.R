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

#' @title Get the percentage of two values pretty formatted.
#' @description Get the percentage of two values pretty formatted.
#'   Thanks to kapsner for the inspiration!
#' @param x (numeric) The absolute value.
#' @param pct_ref (numeric, Optional) The reference value to which the ratio of the
#'   absolute value x is calculated. Default is 1.
#' @param with_percent_sign (boolean, Optional) Should a percentage sign be
#'   added to the final string? Default = TRUE
#' @param with_absolute (boolean, Optional) Should the two absolute reference
#'   values also be output? Default = TRUE
#' @inheritParams robust_round
#' @return A character string.
#' @examples
#'   paste_pct_sum(.15, 2)
#'   #> "7.50% (0.15 of 2)"
#' @export
#'
paste_pct_sum <-
  function(x,
           pct_ref = 1,
           with_percent_sign = TRUE,
           with_absolute = TRUE,
           decimal_separator = ".",
           digits = 2) {
    return(paste0(
      (x / pct_ref * 100) |> DIZtools::robust_round(digits = digits, decimal_separator = decimal_separator),
      ifelse(with_percent_sign, "%", ""),
      ifelse(with_absolute, paste0(" (", x, " of ", pct_ref, ")"), "")
    ))
  }
