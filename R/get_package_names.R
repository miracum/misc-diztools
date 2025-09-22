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

#' @title Get used package names from R/qmd-files.
#' @description E.g. for publication purposes it might be useful to
#'   quickly get all used package names out of a bunch of used scripts.
#'   This function takes the path to all the scripts and extracts the used
#'   package names if they are used in the manner "packagename::function()".
#'
#' @param paths A character vactor with the paths to all files to be searched.
#'   Default: "." (so the current directory).
#' @param file_endings A character vector containing the file types to search
#'   through. Default: "R" and "qmd". Case-sensitive!
#' @param pretty Logical. If `TRUE` (default), the result will be
#'   a single string containing all packages combined in one single string.
#'   If `FALSE`, the result will be a vector, containg all packages
#'   so one can apply the pretty formatting on his/her own.
#' @param include_package_versions Logical. If `TRUE` (default), the result
#'   will contain also the currently installed version of the package.
#'   If the package is not installed, the version will be needed to be fixed
#'   manually (output will be "tbd").
#'
#' @return A vector of all found package names.
#' @examples
#' paths <- c("~", "/path/to/project/R")
#' get_package_names(
#'   paths = paths
#' )
#'
#' @export
#'
get_package_names <- function(paths = c("."),
                              file_endings = c("R", ".qmd"),
                              pretty = TRUE,
                              include_package_versions = TRUE) {
  packages <- ""
  files <- c()

  ## Gather all .R and .qmd files recursively:
  for (path in paths) {
    files <- c(
      files,
      list.files(
        path = path,
        pattern = paste0("\\.(", paste(file_endings, collapse = "|"), ")$"),
        recursive = TRUE,
        full.names = TRUE,
        ignore.case = TRUE
      )
    )
  }


  ## Function to extract R packages out of one file:
  extract_packages <- function(file) {
    ## Read file:
    lines <- tryCatch(
      readLines(file, warn = FALSE),
      error = function(e)
        character(0)
    )

    ## Regex for "package::function":
    matches <- regmatches(lines,
                          gregexpr("\\b([A-Za-z0-9\\.]+)::[A-Za-z0-9_]+", lines))

    ## Extract only the package name:
    pkgs <- unique(unlist(lapply(matches, function(x)
      sub("::.*", "", x))))
    return(pkgs)
  }

  ## Search through all files and combine the result:
  all_packages <- unique(unlist(lapply(files, extract_packages))) |> unique() |> sort()

  if (include_package_versions) {
    versions <- sapply(all_packages, function(package) {
      tryCatch(
        expr = {
          version_string <- utils::packageVersion(package) |> as.character()
          if (pretty) {
            paste0("(", version_string, ")")
          } else {
            version_string
          }
        },
        error = function(e) {
          return("tbd")
        }
      )
    })

    if (pretty) {
      return(paste(
        names(versions),
        " ",
        versions,
        collapse = ", ",
        sep = ""
      ))
    } else {
      all_packages <- versions
    }
  }

  ## Return pretty result:
  if (pretty) {
    all_packages <- paste(all_packages, collapse = ", ")
  }

  return(all_packages)
}
