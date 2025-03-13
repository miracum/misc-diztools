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

#' @title Calculate time difference of two timestamps, round the value and
#'   return a string with suiting unit.
#' @description Create string with time difference in suitable unit.
#'   Additional automatically add the remaining time depending on the position
#'   in an iteration process, or the estimated time of arrival by just
#'   providing the current and total iteration step(s).
#'   A more fancy option might be the package
#'   \href{https://github.com/futureverse/progressr}{progressr}.
#'   See \href{https://github.com/futureverse/future.apply/issues/34#issuecomment-549011124}{progressr}
#'   for a corresponding code snippet.
#' @param older_timestamp (POSIXct) Start time.
#' @param newer_timestamp (POSIXct, Optional) End time. If not set, the current
#'   time will be used.
#' @param iteration (Numeric, Optional) The current iteration if also the time
#'   process within all iterations additional to the elapsed time is of
#'   interest.
#' @param iterations (Numeric, Optional) The total number of iterations.
#' @param remaining_time (Boolean, Optional, Default = TRUE) Should the
#'   estimated time needed to finish all iterations be displayed?
#' @param eta (Boolean, Optional, Default = TRUE) Should the
#'   estimated time of arrival needed to finish all iterations be displayed?
#' @param prefix_iteration,prefix_time_elapsed,prefix_time_remaining,prefix_eta
#'   Prefixes for the output string.
#' @inheritParams robust_round
#' @return A list with one element per row of the input file
#' @examples
#' ## Since no second timestamp is provided, the current time
#' ## (currently 2023-03-08) will be assumed:
#' DIZtools::time_diff_print("2023-01-01 10:00")
#' #> [1] "Time elapsed: 66.20 days"
#' DIZtools::time_diff_print("2023-01-01 10:00", iteration = 7, iterations = 10)
#' #> [1] "Iteration 7 of 10 (70.00 %), Time elapsed: 66.20 days
#' #>     (Remaining: ~ 28.37 days, ETA: ~ 05. Apr 2023 - 23:42 UTC)"
#' @export
#'
time_diff_print <- function(older_timestamp,
                            newer_timestamp = NULL,
                            iteration = NULL,
                            iterations = NULL,
                            remaining_time = TRUE,
                            eta = TRUE,
                            prefix_iteration = "Iteration ",
                            prefix_time_elapsed = "Time elapsed: ",
                            prefix_time_remaining = "Remaining: ",
                            prefix_eta = "ETA: ",
                            digits = 2,
                            thousands_separator = "",
                            decimal_separator = ".") {
  older_timestamp <- as.POSIXct(older_timestamp)

  if (!is.null(iteration)) {
    iteration <- as.numeric(iteration)
  }

  if (!is.null(iterations)) {
    iterations <- as.numeric(iterations)
  }

  if (is.null(newer_timestamp)) {
    newer_timestamp <- Sys.time()
  } else {
    newer_timestamp <- as.POSIXct(newer_timestamp)
  }

  ## Prepare the part with the iteration(s) if necessary:
  if (!is.null(iteration)) {
    if (is.null(iterations)) {
      iterations_str <- NULL
      remaining_time <- FALSE
      eta <- FALSE
    } else {
      iterations_str <-
        paste0(
          " of ",
          iterations,
          " (",
          robust_round((iteration / iterations) * 100,
                       digits = digits,
                       thousands_separator = thousands_separator,
                       decimal_separator = decimal_separator
          ),
          " %)"
        )
    }
    part_iterations <-
      paste0(prefix_iteration, iteration, iterations_str)
  } else {
    part_iterations <- NULL
    remaining_time <- FALSE
    eta <- FALSE
  }

  ## Prepare the part for the time elapsed:
  time_diff <-
    difftime(time1 = newer_timestamp,
             time2 = older_timestamp,
             units = "auto")

  part_time_elapsed <- paste0(
    prefix_time_elapsed,
    robust_round(
      as.numeric(time_diff),
      digits = digits,
      thousands_separator = thousands_separator,
      decimal_separator = decimal_separator
    ),
    " ",
    attributes(time_diff)[["units"]]
  )



  if (isTRUE(remaining_time) || isTRUE(eta)) {
    ## Linear assumption of remaining time depending on elapsed time for
    ## already processed part of all iterations:
    time_remaining <-
      (time_diff / iteration) * (iterations - iteration)
  }
  ## Prepare the part for the remaining time if necessary:
  if (isTRUE(remaining_time)) {
    part_remaining_time <- paste0(
      prefix_time_remaining,
      "~ ",
      robust_round(
        as.numeric(time_remaining),
        digits = digits,
        thousands_separator = thousands_separator,
        decimal_separator = decimal_separator
      ),
      " ",
      attributes(time_remaining)[["units"]]
    )
  } else {
    part_remaining_time <- NULL
  }


  ## Prepare the part for the estimated time of arrival (eta) if necessary:
  if (isTRUE(eta)) {
    part_eta <- paste0(prefix_eta,
                       "~ ",
                       ## TODO: Think about if `newer_timestamp` instead of
                       ## `Sys.time()` to add the remaining time to is more
                       ## intuitive.
                       pretty_timestamp(Sys.time() + time_remaining))
  } else {
    part_eta <- NULL
  }

  ## Remove empty parts:
  part_time_2 <- c(part_remaining_time, part_eta)
  part_time <-
    paste0(
      part_time_elapsed,
      ifelse(is.null(part_time_2), "", " ("),
      paste(part_time_2, collapse = ", "),
      ifelse(is.null(part_time_2), "", ")")
    )

  ## Finally concatenate all parts to the final string:
  res <- paste(c(part_iterations, part_time), collapse = ", ")

  return(res)
}
