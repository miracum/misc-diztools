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

#' @title Function to feedback messages either to the user and/or to the
#'   console and to the logfile.
#' @description This function provides the functionality to publish
#'   any kind of information to the user, the console and/or to the logfile.
#'   This might be a simple info, a warning or an error.
#'   The function can be used to select the output (console, ui, logfile).
#'   If no output is selected, the print_this string will be printed to the
#'   console and to logfile.
#'   One of these must be a string with length > 0: print_me, console, ui.
#'   Default parameters can be set using the function
#'   `DIZtools::log_set_defaults`.
#'   This function uses `logger` as package to log to the console. If you are
#'   new to this function, consider using `logger` instead.
#' @seealso \url{https://daroczig.github.io/logger/}
#' @param print_this (Optional, String, default: "")
#' @param type (Optional, String, default: "Info")
#'   E.g. "Warning", "Error". Default: "Info"
#' @param ui (Optional, Boolean/String, default: FALSE)
#'   If true, the message will also be printed to the user in form of a modal.
#'   Can also be a string.
#' @param console (Optional, Boolean/String, default: TRUE)
#'   If true, the message will also be printed to the console as is.
#'   Can also be a string.
#' @param logfile (Optional, Boolean, default: TRUE)
#'   If true (default) the print_this string will also be printed
#'   to the console.
#' @param logjs (Optional, Boolean, default: FALSE)
#'   If true (default: false) the print_this
#'   string will also be printed to the javascript-console.
#'   This only makes sense, if the gui is active.
#' @param prefix Prefix (Optional, String, default: "")
#'   This is useful if print_this is an array/list.
#'   Each entry will then be new row with this prefix.
#' @param suffix Suffix (Optional, String, default: "")
#'   Same like prefix but at the end of each line.
#' @param findme (Optional, String, default: "")
#'   Recommended with length 10.
#'   String to find the message in the code.
#'   E.g. 10-digit random hex from
#'   \url{https://onlinetools.com/random/generate-random-hexadecimal-numbers}
#' @param logfile_dir (Optional, String, default: "tempdir()")
#'   The absolute path to folder where the logfile will be stored.
#' @param headless (Optional, Boolean, default: TRUE)
#'   Indicating, if the function is run only in the console (headless = TRUE)
#'   or on a GUI frontend (headless = FALSE).
#' @return No return value, called for publishing a message.
#' @examples
#' feedback(
#'   print_this = "This is an error message you can provide",
#'   type = "Error",
#'   findme = "215bb3695c",
#'   logfile_dir = tempdir(),
#'   headless = TRUE
#' )
#'
#' @export
#'
feedback <-
  function(print_this = NULL,
           type = NULL,
           ui = NULL,
           console = NULL,
           logfile = NULL,
           logjs = NULL,
           prefix = NULL,
           suffix = NULL,
           findme = NULL,
           logfile_dir = NULL,
           headless = NULL) {
    log_set_defaults()

    ## If a parameter was supplied to the function, this one will be used,
    ## otherwise the values from `options()` will be used:
    print_this <-
      ifelse(is.null(print_this), options()[["diztools.log.print_this"]],
             print_this)
    type <-
      ifelse(is.null(type), options()[["diztools.log.type"]], type)
    ui <- ifelse(is.null(ui), options()[["diztools.log.ui"]], ui)
    console <-
      ifelse(is.null(console), options()[["diztools.log.console"]], console)
    logfile <-
      ifelse(is.null(logfile), options()[["diztools.log.logfile"]], logfile)
    logjs <-
      ifelse(is.null(logjs), options()[["diztools.log.logjs"]], logjs)
    prefix <-
      ifelse(is.null(prefix), options()[["diztools.log.prefix"]], prefix)
    suffix <-
      ifelse(is.null(suffix), options()[["diztools.log.suffix"]], suffix)
    findme <-
      ifelse(is.null(findme), options()[["diztools.log.findme"]], findme)
    logfile_dir <-
      ifelse(is.null(logfile_dir), options()[["diztools.log.logfile_dir"]],
             logfile_dir)
    headless <-
      ifelse(is.null(headless), options()[["diztools.log.headless"]], headless)

    # Make the first letter of type Uppercase:
    type <- firstup(type)

    # If the gui is active, show the message to the user.
    # If its an error message, also show the error messages in the gui
    # even if the user did not explicitly said it should be displayed
    # in the gui
    if (isTRUE(ui) ||
        (isFALSE(headless) &&
         isTRUE(type == "Error") && isFALSE(ui))) {
      feedback_to_ui(
        print_this = print_this,
        type = type,
        logfile_dir = logfile_dir,
        headless = headless
      )
    }

    if ((isTRUE(console) && isFALSE(print_this == "")) ||
        (isTRUE(typeof(console) == "character"))) {
      feedback_to_console(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix,
        logjs = logjs,
        logfile_dir = logfile_dir,
        headless = headless
      )
    }

    # If there is text defined in 'ui' and/or 'console', print this one
    # (this is uesful if one will provide both, feedback to the ui AND
    # feedback to the console but with different texts).
    # Hint: Everything printed to the console will also
    #       be printed to the logfile.
    if (isTRUE(typeof(ui) == "character")) {
      feedback_to_ui(
        print_this = print_this,
        type = type,
        logfile_dir = logfile_dir,
        headless = headless
      )
    }
  }

#' @title Print to the console. Internal use only.
#' @description  Helper function for the feedback function to print
#'   stuff to the console. Everything will also be added to the logfile.
#'   Internal use. Use the robust 'feedback' function instead.
#'
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#'
feedback_to_console <-
  function(print_this,
           type,
           findme,
           prefix,
           suffix,
           logjs,
           logfile_dir,
           headless = TRUE) {
    if (length(print_this) == 1) {
      logtype <- log_map_type_to_loggertype(type)
      res <-
        feedback_get_formatted_string(
          print_this = print_this,
          type = logtype,
          findme = findme,
          prefix = prefix,
          suffix = suffix
        )
      # To console:
      # message(res)
      logger::log_level(level = logtype, res)

      # To logjs:
      if (isTRUE(logjs)) {
        feedback_to_logjs(
          print_this = res,
          logfile_dir = logfile_dir,
          headless = headless
        )
      }
      # To logfile:
      feedback_to_logfile(
        print_this = print_this,
        type = type,
        findme = findme,
        prefix = prefix,
        suffix = suffix,
        logfile_dir = logfile_dir
      )
    } else if (length(print_this) > 1) {
      i <- 1
      for (tmp in print_this) {
        logtype <- log_map_type_to_loggertype(type)
        res <-
          feedback_get_formatted_string(
            print_this = tmp,
            type = logtype,
            findme = findme,
            prefix = paste0(prefix, i, ": "),
            suffix = suffix
          )

        # To console:
        # message(res)
        logger::log_level(level = logtype, res)

        # To logjs:
        if (isTRUE(logjs)) {
          feedback_to_logjs(
            print_this = res,
            logfile_dir = logfile_dir,
            headless = headless
          )
        }
        # To logfile:
        feedback_to_logfile(
          print_this = tmp,
          type = type,
          findme = findme,
          prefix = prefix,
          suffix = suffix,
          logfile_dir = logfile_dir
        )
        i <- i + 1
      }
    }
  }

#' @title Feedback to the user with a modal. Internal use.
#' @description  Helper function for the feedback function to show modals
#'   to the gui/user. Everything will also be added to the logfile.
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#'
feedback_to_ui <-
  function(print_this, type, logfile_dir, headless = FALSE) {
    catch_msg <- paste0("Something went wrong while trying",
                        " to show feedback to the UI.",
                        " Are you sure the GUI is running? ")
    tryCatch({
      title <- type
      shiny::showModal(shiny::modalDialog(title = title,
                                          easyClose = TRUE,
                                          print_this))
    }, error = function(e) {
      # title <- "Sorry, an error has occured"
      msg <- paste0(
        "`shiny` might not be installed. So the error '",
        print_this,
        "' can't be displayed to the UI! Please install shiny e.g. via `",
        "install.packages('shiny')",
        "` to also make this error beeing displayed in the GUI."
      )
      feedback(
        print_this = msg,
        type = "Error",
        findme = "443de63bba",
        logfile_dir = logfile_dir,
        headless = TRUE,
        ui = FALSE
      )
    })
  }

#' @title Feedback to the gui/browser-console with logjs. Internal use.
#' @description  Helper function for the feedback function to also show the
#'   messages to the gui/user via the browser console.
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#'
feedback_to_logjs <- function(print_this, logfile_dir, headless) {
  catch_msg <- paste0("Something went wrong while trying",
                      " to print feedback to the browser console: ")
  tryCatch({
    shinyjs::logjs(print_this)
  },
  error = function(cond) {
    feedback(
      print_this = paste0(catch_msg, cond),
      type = "Error",
      findme = "2e68833975",
      logfile_dir = logfile_dir,
      headless = headless
    )
  },
  warning = function(cond) {
    feedback(
      print_this = paste0(catch_msg, cond),
      type = "Warning",
      findme = "f3600cc9d2",
      logfile_dir = logfile_dir,
      headless = headless
    )
  })
}

#' @title Add to the logfile. Internal use.
#' @description  Helper function for the feedback function to add content
#'   to the logfile. Internal use.
#'   Use the robust 'feedback' function instead.
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#'
feedback_to_logfile <-
  function(print_this,
           type,
           findme,
           prefix,
           suffix,
           logfile_dir) {
    # Get the formatted string out of the parameters which looks like
    # "[Info] System is running (1234567890)":
    res <- feedback_get_formatted_string(
      print_this = print_this,
      type = type,
      findme = findme,
      prefix = prefix,
      suffix = suffix
    )
    # Set the string for the logfile containing the current time and date
    # and a linebreak at the end:
    res <- paste0("[", Sys.time(), "] ", res, "\n")

    logfile_dir <- clean_path_name(pathname = logfile_dir,
                              remove.slash = TRUE)

    path_with_file <- file.path(logfile_dir, "logfile.log") %>%
      normalizePath(mustWork = FALSE)

    if (!dir.exists(logfile_dir)) {
      dir.create(logfile_dir, recursive = TRUE)
    }

    if (!file.exists(path_with_file)) {
      file.create(path_with_file)
    }

    # Write to the logfile:
    cat(res, file = path_with_file, append = TRUE)
  }


#' @title Format the feedback string
#' @description  Helper function for the feedback function to combine the input
#'   parameters in proper manner to be a pretty and informative string which
#'   than can be added to the logfile and/or be displayed in the console.
#'   CAUTION: 'print_this' must be of length 1! For arrays loop through them
#'   by hand and call this function several times!
#'   Internal use. Use the robust 'feedback' function instead.
#' @inheritParams feedback
#' @return Returns a properly an consistent formatted string containing
#'   the parameters handed over to this function.
#'
feedback_get_formatted_string <-
  function(print_this, type, findme, prefix, suffix) {
    if (length(print_this) == 1) {
      if (is.null(type) || !all(class(type) == "character")) {
        type <- ""
      } else {
        type <- paste0("[", type, "] ")
      }
      if (findme != "") {
        findme <- paste0(" (", findme, ")")
      }
      res <- paste0(type, prefix, print_this, suffix, findme)
    } else {
      res <- paste0("Length of input 'print_this' is not == 1. ",
                    "See function description. (55a445fe57)")
    }
    return(res)
  }

#' @title Archives the current logfile and creates a new blank one.
#' @description  This function is called once at the beginning of the
#'   runtime of the tool. It checks whether there is an old logfile
#'   and renames it (if existing) to "logfile_20yy-mm-dd-HHMMSS.log".
#'   Then a new, empty, logfile "logfile.log" is created.
#'
#' @inheritParams feedback
#' @return No return value, called for side effects (see description)
#'
#' @examples
#' cleanup_old_logfile("path/to/logfile/dir/")
#'
#' @export
#'
cleanup_old_logfile <- function(logfile_dir) {

  logfile_dir <-
    clean_path_name(pathname = logfile_dir, remove.slash = TRUE)

  path_with_file <- file.path(logfile_dir, "logfile.log") %>%
    normalizePath(mustWork = FALSE)

  # Check if logfile.log is already the logfile for this session:
  if (file.exists(path_with_file)) {
    ## There is an old logfile, so rename the logfile.log to
    ## logfile_2020-01-01-1234h:
    filename_datetime <- format(Sys.time(), "%Y-%m-%d-%H%M%OS")
    path_with_file_datetime <- file.path(
      logfile_dir,
      paste0("logfile_", filename_datetime, ".log")
    )
    file.rename(from = path_with_file, to = path_with_file_datetime)
    ## ... and create a new logfile:
    file.create(path_with_file)
  }
}

#' @title Set default options for all log-functions
#' @description This function sets the default log options. Parameters not
#'   supplied to this function will be set with the default value. If you
#'   want to reset all parameters to the default ones, run
#'   \code{log_set_defaults(reset = TRUE)}. This can also be combined with
#'   a new custom default value:
#'   \code{log_set_defaults(reset = TRUE, prefix = "Prefix")}
#'   which will reset all parameters to default and afterwards assign "Prefix"
#'   as new global prefix.
#'
#' @inheritParams feedback
#' @param reset (boolean, default = FALSE) Should all parameters be reset to
#'   their default values?
#'
#' @return No return value, called for side effects (see description).
#' @examples
#'   DIZtools::log_set_defaults(logfile_dir = tempdir())
#'
#' @export
#'
log_set_defaults <- function(print_this = NULL,
                             type = NULL,
                             ui = NULL,
                             console = NULL,
                             logfile = NULL,
                             logjs = NULL,
                             prefix = NULL,
                             suffix = NULL,
                             findme = NULL,
                             logfile_dir = NULL,
                             headless = NULL,
                             reset = FALSE) {
  if (isTRUE(options()[["diztools.log.__init_success"]]) && !reset) {
    ## The default settings have already been written to to the options.
    ## Another call would overwrite user changes!

    # print("Skipping setting default values. Already done.")
  } else {
    # print("Setting default values.")

    ## Set the log layout:
    logger::log_layout(logger::layout_glue_colors)

    ## Assign default options:
    options(log_get_default_options())

    ## Set flag to not overwrite the (user) settings in another call:
    options("diztools.log.__init_success" = TRUE)
  }

  new_defaults <- list(
    print_this = print_this,
    type = type,
    ui = ui,
    console = console,
    logfile = logfile,
    logjs = logjs,
    prefix = prefix,
    suffix = suffix,
    findme = findme,
    logfile_dir = logfile_dir,
    headless =  headless
  )

  ## Remove NULL elements:
  new_defaults[sapply(new_defaults, is.null)] <- NULL

  if (length(new_defaults) > 0) {
    ## Add prefix:
    names(new_defaults) <-
      paste0("diztools.log.", names(new_defaults))

    # print(paste("Assigning new values", names(new_defaults), collapse = ", "))

    ## Assign the new options:
    options(new_defaults)
  }

  ## Further checks:
  stopifnot(is.logical(options()[["diztools.log.headless"]]))
}

#' @title Get the default settings for the logging function as list.
#' @description Get the default settings for the logging function as list
#'
#' @return The list with the default parameters.
#' @examples
#'   log_get_default_options()
#'
#' @export
#'
log_get_default_options <- function() {
  default <- list(
    "diztools.log.headless" = TRUE,
    "diztools.log.type" = "Info",
    "diztools.log.ui" = FALSE,
    "diztools.log.console" = TRUE,
    "diztools.log.logfile" = TRUE,
    "diztools.log.logjs" = FALSE,
    "diztools.log.prefix" = "",
    "diztools.log.suffix" = "",
    "diztools.log.findme" = "",
    "diztools.log.logfile_dir" = tempdir(),
    "diztools.log.headless" = TRUE
  )
  return(default)
}


#' @title Get the current settings for the logging function as list.
#' @description Get the current settings for the logging function as list
#'
#' @return The list with the current parameters.
#' @examples
#'   log_get_current_options()
#'
#' @export
#'
log_get_current_options <- function() {
  ## Get all names:
  names <- grep(
    pattern = "^(diztools.log.)",
    x = names(options()),
    value = TRUE
  )

  ## Remove internal stuff:
  names <- names[!grepl(pattern = "^(diztools.log.__)", x = names)]

  return(options()[names])
}


#' @title Remove all log-related options from `options()`.
#' @description Remove all log-related options from `options()`.
#'
#' @return Nothing.
#' @examples
#'   log_remove_options()
#'
#' @export
#'
log_remove_options <- function() {
  options(sapply(grep(
    pattern = "^(diztools.log.)",
    x = names(options()),
    value = TRUE
  ), function(x) {
    return(NULL)
  }, USE.NAMES = TRUE))
}


log_set_options_list <- function(options_list) {
  options(options_list)
}


#' @title Get the logger type from the type string (the argument of the
#'   `feedback()` function)
#' @description Mapping the log-types from string to logger::<type>.
#'   E.g. the string "Info" will be mapped to `logger::INFO`.
#'
#' @param type (String) The type of the message. E.g. "error", "Info".
#'
#' @return The `logger`type. If no corresponding logger-type is found,
#'   the result will be `NULL`.
#'
log_map_type_to_loggertype <- function(type) {
  type <- tolower(type)
  if (type == "info") {
    return(logger::INFO)
  } else if (type == "debug") {
    return(logger::DEBUG)
  } else if (type == "trace") {
    return(logger::TRACE)
  } else if (type == "warning" || type == "warn") {
    return(logger::WARN)
  } else if (type == "err" || type == "error") {
    return(logger::ERROR)
  } else if (type == "fatal") {
    return(logger::FATAL)
  } else {
    return(NULL)
  }
}

#' @title Internal function for debugging only.
#' @description Internal function for debugging only.
#'
#' @return Nothing.
#'
log_internal_test <- function() {
  print_this <- NULL
  type <- NULL
  ui <- NULL
  console <- NULL
  logfile <- NULL
  logjs <- NULL
  prefix <- NULL
  suffix <- NULL
  findme <- NULL
  logfile_dir <- NULL
  headless <- NULL

  new_defaults <- list(
    print_this = print_this,
    type = type,
    ui = ui,
    console = console,
    logfile = logfile,
    logjs = logjs,
    prefix = prefix,
    suffix = suffix,
    findme = findme,
    logfile_dir = logfile_dir,
    headless =  headless
  )

  cleaR::clear()
  log_remove_options()
  options()[grepl(pattern = "^(diztools)", x = names(options()))]

  feedback("test")
  feedback("test with prefix", prefix = "prefixxxx ")
  feedback("test without prefix")
  feedback("Setting prefix gobally now...")

  options()[["diztools.log.prefix"]]
  log_set_defaults(prefix = "global prefix - ")
  options()[["diztools.log.prefix"]]

  feedback("here should be a prefix now")
  feedback(
    "here should be another locally overwritten prefix now",
    prefix = "local prefix - "
  )
  feedback("here should be the global prefix again")

  log_set_defaults(reset = TRUE)
  feedback("All settings were resetted - here should no prefix.")

  options()[grepl(pattern = "^(diztools.log.)", x = names(options()))]
}
