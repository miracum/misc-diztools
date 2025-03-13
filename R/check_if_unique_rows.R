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

#' @title Takes a data.table dataset and checks if for each unique
#'   element in a specified column there is exaclty one row.
#'
#' @description Takes a data.table dataset and checks if for each unique
#'   element in a specified column there is exaclty one row.
#'
#'
#' @param data A data.table
#' @param colname The name of the column to check for uniqueness.
#' @inheritParams feedback
#' @param stop (boolean, default = FALSE) Should the function call
#'   \code{stop()} if there are non-unique rows in the data?
#' @param feedback (boolean, default = TRUE) Should the function print
#'   text to the console depending on the result?
#' @param print_invalid_rows (boolean, default = TRUE) Should the function
#'   print invalid rows to the console?
#' @param return (boolean, default = TRUE) Should the function return `TRUE`
#'   or `FALSE` depending on the result? If `stop = TRUE` is set, the function
#'   will end with `stop()` before returning anything.
#'
#' @examples
#' \dontrun{
#'   check_if_unique_rows(data)
#' }
#'
#' @export
#'
check_if_unique_rows <-
  function(data,
           colname,
           findme = NULL,
           stop = FALSE,
           feedback = TRUE,
           print_invalid_rows = TRUE,
           return = TRUE) {
    if (length(unique(data[[colname]])) != nrow(data)) {
      multiple_rows <- data[, .N, by = colname][get("N") > 1,]
      if (feedback) {
        DIZtools::feedback(
          print_this = paste0(
            "There are some values more than one time",
            " in column '",
            colname,
            ifelse(
              test = print_invalid_rows,
              yes = paste0(
                "'! Invalid/Multiple entries: '",
                paste(multiple_rows[[colname]], collapse = "', '"),
                "'"
              ),
              no = "'!"
            )
          ),
          type = "Error",
          findme = findme
        )
        if (print_invalid_rows) {
          ## Print rows with more than one row per colname:
          print(multiple_rows)
        }
      }
      if (stop) {
        stop("See error above.")
      }
      if (return) {
        return(FALSE)
      }
    } else {
      if (feedback) {
        DIZtools::feedback(
          print_this = paste0("No duplicate rows for colname '",
                              colname,
                              "' found. OK."),
          findme = findme
        )
      }
      if (return) {
        return(TRUE)
      }
    }
  }
