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

#' @title Get the content of a data.table row in print-ready format.
#' @description Create string of the content of a data.table row in
#'   print-ready format.
#' @param dt (data.table) The input data.table.
#' @param row (int, Optional) Row id to be used. Defaults to 1.
#' @param quote (character, Optional) A quote parameter to be applied
#'   to all values of the rows.
#' @inheritParams base::paste
#' @return A character string. To print the result, simply forward it to
#'   print: \code{dt |> dt_row_to_string()}
#' @examples
#'   data.table::data.table(name = "Alice",
#'                          dob = as.POSIXct("1980-01-01"),
#'                          sex = "f") |>
#'     DIZtools::dt_row_to_string()
#' @export
#'
dt_row_to_string <-
  function(dt,
           row = 1,
           sep = ", ",
           collapse = ": ",
           quote = "'") {
    col_str <- c()
    for (col in names(dt)) {
      col_str <-
        c(col_str, paste0(col, collapse, quote, dt[row, get(col)], quote))
    }
    return(paste(col_str, collapse = sep))
  }
