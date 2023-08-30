
<!-- !!! ############################################################ !!! -->
<!-- This page is auto generated from `README.qmd`. -->
<!-- Don't change the .md file manually! -->
<!-- !!! ############################################################ !!! -->

# DIZtools <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![CRAN Status
Badge](https://www.r-pkg.org/badges/version-ago/DIZtools.png)](https://cran.r-project.org/package=DIZtools)
[![Cran
Checks](https://badges.cranchecks.info/worst/DIZtools.svg)](https://cran.r-project.org/web/checks/check_results_DIZtools.html)
[![](http://cranlogs.r-pkg.org/badges/grand-total/DIZtools?color=blue.png)](https://cran.r-project.org/package=DIZtools)
[![](http://cranlogs.r-pkg.org/badges/last-month/DIZtools?color=blue.png)](https://cran.r-project.org/package=DIZtools)
[![Dependencies](https://tinyverse.netlify.com/badge/DIZtools.png)](https://cran.r-project.org/package=DIZtools)
[![R CMD Check via
{tic}](https://github.com/miracum/misc-diztools/workflows/R%20CMD%20Check%20via%20%7Btic%7D/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![linting](https://github.com/miracum/misc-diztools/workflows/lint/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![test-coverage](https://github.com/miracum/misc-diztools/workflows/test-coverage/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![codecov](https://codecov.io/gh/miracum/misc-diztools/branch/main/graph/badge.svg)](https://app.codecov.io/gh/miracum/misc-diztools)
<!-- badges: end -->

The R package `DIZtools` provides utility functions used for the R
package development infrastructure inside the data integration centers
(‘DIZ’) to standardize and facilitate repetitive tasks such as setting
up a database connection or issuing notification messages and to avoid
redundancy.

:bulb: `DIZtools` contains all “lightweighted” functions of
[`DIZutils`](https://github.com/miracum/misc-dizutils) making it a lot
quicker to install, while
[`DIZutils`](https://github.com/miracum/misc-dizutils) has a lot of
dependencies and system requirements.

## Installation

You can install `DIZtools` directly from CRAN:

``` r
install.packages("DIZtools")
```

The development version can be installed using

``` r
install.packages("remotes")
remotes::install_github("miracum/misc-diztools", ref = "dev")
```

## Exported functions

-   [`assign_to_R_env()`](./R/assign_to_R_env.R): Add variable to R
    environment (in contrast to system environment).
-   [`check_if_unique_rows()`](./R/check_if_unique_rows.R): Takes a
    data.table dataset and checks if for each unique element in a
    specified column there is exaclty one row.
-   [`clean_path_name()`](./R/clean_path_name.R): Clean paths to surely
    have a tailing slash or not.
-   [`clear()`](./R/clear.R): Clean the console and
    environment-variables.
-   [`close_all_connections()`](./R/close_all_connections.R):
    Unset/close all open connections.
-   [`dt_row_to_string()`](./R/dt_row_to_string.R): Get the content of a
    data.table row in print-ready format.
-   [`equals2()`](./R/equals2.R): Robust compare two elements and return
    true if both elements are the same. False otherwise. No `NA` or
    `NULL`.
-   [`feedback()`](./R/feedback.R): Function to feedback messages either
    to the user and/or to the console and to the logfile.
-   [`file_lines_to_list()`](./R/file_lines_to_list.R): Read in lines
    from a file and store it in a list.
-   [`firstup()`](./R/firstup.R): Converts the first letter of the input
    string to uppercase.
-   [`format_POSIXct()`](./R/format_POSIXct.R): Formats a given POSIXct
    timestamp without the need of manually specifing format parameters.
-   [`get_config()`](./R/get_config.R): Reads a config yaml file and
    return the value for a given key.
-   [`get_current_timestamp()`](./R/get_current_timestamp.R): Quickly
    get the current time stamp without the need to handle format-options
    etc.
-   [`is_date_format()`](./R/is_date_format.R): Checks if a string
    matches a given date format.
-   [`is.empty()`](./R/is.empty.R): Check for
    empty/`NA`/`NULL`/`NaN`/etc. values.
-   [`notin()`](./R/notin.R): notin helper function. Opposite of `in`
    function.
-   [`number_to_position()`](./R/number_to_position.R): Converts an
    integer number to its “verbal position”. 1 –\> “1st”, 2 –\> “2nd”, 3
    –\> “3rd”, 4 –\> “4th”, …
-   [`paste_pct_sum()`](./R/paste_pct_sum.R): Get the percentage of two
    values pretty formatted.
-   [`paste2()`](./R/paste2.R): Normal `paste` function with additional
    `collapse_last` argument.
-   [`pretty_timestamp()`](./R/pretty_timestamp.R): Quickly get a pretty
    timestamp without need to handle format-options etc.
-   [`rep2()`](./R/rep2.R): Repeat something with the ability to also
    collapse the output.
-   [`robust_round()`](./R/robust_round.R): Round numbers without
    problems.
-   [`setdiff_all()`](./R/setdiff_all.R): Get the difference of two
    vectors in both directions.
-   [`setenv_file()`](./R/setenv_file.R): Set all variables of a `.env`
    file to the system environment.
-   [`setenv2()`](./R/setenv2.R): Assign variables to the system
    environment.
-   [`string_replacements()`](./R/string_replacements.R): Clean string
    with a given set of replacements.
-   [`time_diff_print()`](./R/time_diff_print.R): Calculate time
    difference of two timestamps, round the value and return a string
    with suiting unit.
-   [`trim.space()`](./R/trim.space.R): Trim Spaces of a string.
-   [`vgsub()`](./R/vgsub.R): Vectorised string replacement.

## Internal functions

:bulb: Use with care. Can be used by typing
`DIZtools:::internal_function_name()` (\<- using three `:`). Not
recommended.

-   [`dot_helper()`](./R/dot_helper.R)
-   [`zzz()`](./R/zzz.R)

## More Infos

-   about MIRACUM: <https://www.miracum.org/>
-   about the Medical Informatics Initiative:
    <https://www.medizininformatik-initiative.de/de/start>
