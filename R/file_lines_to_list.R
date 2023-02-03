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

#' @title Read in lines from a file and store it in a list.
#' @description Read in lines from a file and store it in a list.
#' @param filepath (string) Path to file to read in.
#' @return A list with one element per row of the input file
#' @export
#'
file_lines_to_list = function(filepath) {
  nr_of_lines <- R.utils::countLines(filepath)
  con_input = file(filepath, "r")

  res <- vector("list", length = nr_of_lines)

  for (l in 1:nr_of_lines) {
    line = readLines(con_input, n = 1)
    if (length(line) == 0) {
      break
    }
    res[[l]] <- line
  }
  close(con_input)

  return(res)
}
