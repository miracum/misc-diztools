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

#' @title Vectorised String Replacement
#'
#' @description A simple wrapper for \code{\link{gsub}} that replaces all
#'   patterns from \code{pattern} argument with ones in \code{replacement}
#'   over vector provided in argument \code{x}.
#' @param pattern see eponymous argument for \code{\link{gsub}} function
#' @param replacement see eponymous argument for \code{\link{gsub}} function
#' @param x see eponymous argument for \code{\link{gsub}} function
#' @param ... additional arguments for \code{\link{gsub}} function
#' @references See original thread for more details \url{https://stackoverflow.com/a/6954308/457898}. Special thanks to user Jean-Robert for this one!
#' @return a character vector with string replacements
#' @source \href{https://github.com/Rapporter/rapportools/blob/master/R/utils.R}{Copied from `rapportools::is.empty()`}
#' @export
vgsub <- function(pattern, replacement, x, ...) {
  for (i in 1:length(pattern)) {
    x <- gsub(pattern[i], replacement[i], x, ...)
  }
  return(x)
}
