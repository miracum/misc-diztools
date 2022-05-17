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


test_that(desc = "correct functioning of log functions", code = {
  log_remove_options()
  log_dir <- tempdir()

  cleanup_old_logfile(log_dir)

  feedback(print_this = "This is a first message.",
           logfile_dir = log_dir)

  feedback(print_this = "This is a second message.",
           logfile_dir = log_dir)

  con = file(paste0(log_dir, "/logfile.log"), "r")
  lines_log = readLines(con)
  close.connection(con)

  expect_length(object = lines_log, n = 2)

  cleanup_old_logfile(log_dir)


  invisible(do.call(file.remove,
                    list(
                      list.files(tempdir(), pattern = "log$", full.names = TRUE)
                    )))
})
