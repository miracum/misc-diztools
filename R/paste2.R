# DIZtools - Utilities for 'DIZ' R Package Development
# Copyright (C) 2020-2022 Universitätsklinikum Erlangen, Germany
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

#' @title Normal `paste` function with additional `collapse_last` argument.
#' @description The base `paste` function but with the add on to also supply a
#'   `collapse_last` value to change the `collapse` argument at the last
#'   position. To get from "cat", "mouse", "dog" to a string
#'   "cat, mouse and dog", one simply needs to call
#'   `paste(c("cat","mouse","dog"), collapse = ", ", collapse_last = " and ")`
#'
#' @param collapse_last (string, optional) The string to use for the last
#'   instance while collapsing. All other elements will be pasted using
#'   the normal `collapse` argument.
#' @inheritParams base::paste
#' @return String. See`?paste` for details.
#' @examples{
#'   paste2(c("cat", "mouse", "dog"),
#'          collapse = ", ",
#'          collapse_last = " and ")
#'   #> [1] "cat, mouse and dog"
#' }
#' @export
#'
paste2 <- function(...,
                   collapse = NULL,
                   collapse_last = NULL) {
  if (is.character(collapse_last) && is.character(collapse)) {
    return(sub(
      pattern = paste0("(.*)", collapse),
      replacement = paste0("\\1", collapse_last),
      x =  paste(..., collapse = collapse)
    ))
  } else {
    return(paste(..., collapse = collapse))
  }
}
