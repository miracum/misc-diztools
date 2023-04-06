<!-- !!! ############################################################ !!! -->
<!-- This page is auto generated from `README.Rmd`. -->
<!-- Don't change the .md file manually! -->
<!-- !!! ############################################################ !!! -->

# DIZtools <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![CRAN Status
Badge](https://www.r-pkg.org/badges/version-ago/DIZtools)](https://cran.r-project.org/package=DIZtools)
[![Cran
Checks](https://badges.cranchecks.info/worst/DIZtools.svg)](https://cran.r-project.org/web/checks/check_results_DIZtools.html)
[![](http://cranlogs.r-pkg.org/badges/grand-total/DIZtools?color=blue)](https://cran.r-project.org/package=DIZtools)
[![](http://cranlogs.r-pkg.org/badges/last-month/DIZtools?color=blue)](https://cran.r-project.org/package=DIZtools)
[![Dependencies](https://tinyverse.netlify.com/badge/DIZtools)](https://cran.r-project.org/package=DIZtools)
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


    ```r
    install.packages("DIZtools")
    ```

The development version can be installed using


    ```r
    install.packages("remotes")
    remotes::install_github("miracum/misc-diztools", ref = "dev")
    ```

## Contained functions

-   [`assign_to_R_env`](./R/assign_to_R_env.R)
-   [`check_if_unique_rows`](./R/check_if_unique_rows.R)
-   [`clean_path_name`](./R/clean_path_name.R)
-   [`clear`](./R/clear.R)
-   [`close_all_connections`](./R/close_all_connections.R)
-   [`dot_helper`](./R/dot_helper.R)
-   [`equals2`](./R/equals2.R)
-   [`feedback`](./R/feedback.R)
-   [`file_lines_to_list`](./R/file_lines_to_list.R)
-   [`firstup`](./R/firstup.R)
-   [`format_POSIXct`](./R/format_POSIXct.R)
-   [`get_config`](./R/get_config.R)
-   [`get_current_timestamp`](./R/get_current_timestamp.R)
-   [`is_date_format`](./R/is_date_format.R)
-   [`is.empty`](./R/is.empty.R)
-   [`notin`](./R/notin.R)
-   [`number_to_position`](./R/number_to_position.R)
-   [`paste2`](./R/paste2.R)
-   [`pretty_timestamp`](./R/pretty_timestamp.R)
-   [`rep2`](./R/rep2.R)
-   [`robust_round`](./R/robust_round.R)
-   [`setdiff_all`](./R/setdiff_all.R)
-   [`setenv_file`](./R/setenv_file.R)
-   [`setenv2`](./R/setenv2.R)
-   [`string_replacements`](./R/string_replacements.R)
-   [`time_diff_print`](./R/time_diff_print.R)
-   [`trim.space`](./R/trim.space.R)
-   [`vgsub`](./R/vgsub.R)
-   [`zzz`](./R/zzz.R)

## More Infos

-   about MIRACUM: <https://www.miracum.org/>
-   about the Medical Informatics Initiative:
    <https://www.medizininformatik-initiative.de/de/start>
