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

#' @title Add variable to R environment (in contrast to system environment).
#' @description Hack variable into global env (bypasses R CMD checks).
#'   This does create a new variable in the R environment but NOT a new
#'   variable in the system environment. To create a system environment
#'   variable being accessible via `Sys.getenv(...)`, use the function
#'   `DIZtools::setenv2(key = "varname", val = 7)`.
#'   Old function name: `global_env_hack()`
#'
#' @param key A character (!) string. The name of the assigned variable
#' @param val An object. The object that will be assigned to 'key'.
#' @param pos An integer. The position of the environment (default: 1).
#'
#' @seealso \url{http://adv-r.had.co.nz/Environments.html}
#' @return No return value, called for side effects (see description).
#' @examples
#' utils_path <- tempdir()
#' assign_to_R_env(
#'   key = "utils_path",
#'   val = utils_path,
#'   pos = 1L
#' )
#'
#' @export
#'
assign_to_R_env <- function(key,
                            val,
                            pos = 1) {
  assign(
    key,
    val,
    envir = as.environment(pos)
  )
}
