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

#' @title Clean the console and environment-variables.
#'
#' @description Function to clean the local environment.
#'   The call of this function clears the console and the local environment
#'   variables.
#' @param keep_environment (Optional, boolean) If true, the objects from the
#'   environment will not be deleted/emptied.
#' @param keep_console (Optional, boolean) If true, the console will not
#'   be emptied.
#'
#' @return Nothing.
#'
#' @examples
#' clear()
#'
#'
#' @export
#'
clear <- function(keep_environment = FALSE,
                  keep_console = FALSE) {
  cleaR::clear(keep_environment = keep_environment, keep_console = keep_console)
  DIZtools::feedback(
    print_this = paste0(
      "`DIZtools::clear()` was replaced by `cleaR::clear()`.",
      " This time, your call of `DIZtools::clear()` will be redirected",
      " directly to `cleaR::clear()` but it will be removed from `DIZtools`",
      " in the near future. So update your code to avoid it to break with",
      " later releases of `DIZtools` by simply replacing `DIZtools::clear()`",
      " with `cleaR::clear()`."
    ),
    type = "Warning",
    findme = "70b96bdac4"
  )
}
