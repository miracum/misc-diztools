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

#' @title Set all variables of a `.env` file to the system environment.
#'
#' @description Internal function to set environment variables that are
#'   necessary for the database connections with \code{db_connection}.
#'   Old function name: `set_env_vars()`.
#'
#' @param env_file A character. The full path including the file name to
#'   the file containing the environment variable definitions to be loaded.
#'
#' @seealso \code{Sys.setenv}
#' @return No return value, called for side effects (see description)
#' @examples
#' \dontrun{set_env_vars("./.env")}
#'
#' @export
#'
setenv_file <- function(env_file) {

  envs <- readLines(env_file)

  args <- sapply(envs, FUN = function(x) {
    # split variables by "="
    l <- unlist(strsplit(x, "="))
    if (length(l) > 1) {
      # needed, if value contains "="
      env <- paste(l[2:length(l)], collapse = "=")
      # name value
      names(env) <- unlist(strsplit(x, "="))[[1]]
    } else {
      env <- ""
      names(env) <- l
    }
    return(env)
  }, USE.NAMES = F)

  # set all environment variables
  do.call(Sys.setenv, as.list(args))
}
