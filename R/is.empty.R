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

#' @title Check for empty/`NA`/`NULL`/`NaN`/etc. values.
#'
#' @description Rails-inspired helper that checks if vector values are "empty",
#'   i.e. if it's: \code{NULL}, zero-length, \code{NA}, \code{NaN},
#'   \code{FALSE}, an empty string or \code{0}.
#'   Note that unlike its native R \code{is.<something>} sibling functions,
#'   \code{is.empty} is vectorised (hence the "values").
#' @param x an object to check its emptiness
#' @param trim trim whitespace? (\code{TRUE} by default)
#' @param all return overall result over list/vector instead of vector of
#'   results? \code{is.empty(x, all = TRUE)} is the same like
#'   \code{all(unlist(is.empty(x)))}
#' @param ... additional arguments for \code{\link{sapply}}
#' @source \href{https://github.com/Rapporter/rapportools/blob/master/R/utils.R}{Copied from `rapportools::is.empty()`}
#' @examples \dontrun{
#' is.empty(NULL)     # [1] TRUE
#' is.empty(c())      # [1] TRUE
#' is.empty(NA)       # [1] TRUE
#' is.empty(NaN)      # [1] TRUE
#' is.empty("")       # [1] TRUE
#' is.empty(0)        # [1] TRUE
#' is.empty(0.00)     # [1] TRUE
#' is.empty("    ")   # [1] TRUE
#' is.empty("foobar") # [1] FALSE
#' is.empty("    ", trim = FALSE)             # [1] FALSE
#' ## is.empty is vectorised!
#' all(is.empty(rep("", 10)))                 # [1] TRUE
#' all(is.empty(matrix(NA, 10, 10)))          # [1] TRUE
#' is.empty(matrix(NA, 10, 10), all = TRUE))  # [1] TRUE
#' }
#' @export
is.empty <- function(x, trim = TRUE, all = FALSE, ...) {
  if (length(x) <= 1) {
    if (is.list(x)) {
      ## otherwise `x <- list(a = NULL)` causes an error:
      x <- unlist(x)
    }
    if (is.null(x)) {
      return(TRUE)
    }
    if (length(x) == 0) {
      return(TRUE)
    }
    if (is.na(x) || is.nan(x)) {
      return(TRUE)
    }
    if (is.character(x) &&
        nchar(ifelse(trim, trim.space(x), x)) == 0) {
      return(TRUE)
    }
    if (is.logical(x) && !isTRUE(x)) {
      return(TRUE)
    }
    if (is.numeric(x) && x == 0) {
      return(TRUE)
    }
    return(FALSE)
  } else{
    if (isTRUE(all)) {
      all(unlist(sapply(
        x, is.empty, trim = trim, all = all, ...
      )))
    } else {
      sapply(x, is.empty, trim = trim, all = all, ...)
    }
  }
}
