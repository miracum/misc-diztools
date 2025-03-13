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

#' @title Trim Spaces of a string.
#'
#' @description Removes leading and/or trailing space(s) from a character
#'   vector. By default, it removes both leading and trailing spaces.
#' @param x a character vector which values need whitespace trimming
#' @param what which part of the string should be trimmed.
#'   Defaults to \code{both} which removes trailing and leading spaces.
#'   If \code{none}, no trimming will be performed.
#' @param space.regex a character value containing a regex that defines a
#'   space character
#' @param ... additional arguments for \code{\link{gsub}} function
#' @return a character vector with (hopefully) trimmed spaces
#' @source \href{https://github.com/Rapporter/rapportools/blob/master/R/utils.R}{Copied from `rapportools::is.empty()`}
#' @export
trim.space <-
  function(x,
           what = c("both", "leading", "trailing", "none"),
           space.regex = "[:space:]",
           ...) {
    if (missing(x))
      stop("nothing to trim spaces to =(")
    re <- switch(
      match.arg(what),
      both     = sprintf("^[%s]+|[%s]+$", space.regex, space.regex),
      leading  = sprintf("^[%s]+", space.regex),
      trailing = sprintf("[%s]+$", space.regex),
      none     = {
        return(x)
      }
    )
    vgsub(re, "", x, ...)
  }
