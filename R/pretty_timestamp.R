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

#' @title Quickly get a pretty timestamp without
#'   need to handle format-options etc.
#'
#' @description Function to quickly get a pretty timestamp without
#'   need to handle format-options etc.
#' @param timestamp A POSIXct timestamp or a string which ca be converted to
#'   a POSIXct timestamp.
#' @param no_spaces Boolean. Default = `FALSE`. Specifies whether the output
#'   can contain spaces or not. E.g. if the output is for human reading,
#'   `no_spaces = FALSE` is a good option. As suffix for file names
#'   (e.g. logfiles), `no_spaces = TRUE` might be a good option.
#' @return The timestamp in always the same format.
#'#'
#' @examples
#' pretty_timestamp("2023-10-30 12:34:56", no_spaces = TRUE)
#' # Result: "2023-10-30T123456"
#' pretty_timestamp("2023-10-30 12:34:56")
#' # this is the same like
#' pretty_timestamp("2023-10-30 12:34:56", no_spaces = FALSE)
#' # Result: "30. Oct 2023 - 12:34 UTC"
#'
#' @export
#'
pretty_timestamp <- function(timestamp, no_spaces = FALSE) {
  timestamp <- as.POSIXct(timestamp)
  if (no_spaces) {
    return(format(timestamp, format = "%Y-%m-%dT%H%M%S"))
  } else {
    return(format(timestamp, format = "%d. %b %Y - %H:%M UTC"))
  }
}
