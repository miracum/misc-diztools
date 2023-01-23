# DIZtools <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->
[![CRAN Status Badge](https://www.r-pkg.org/badges/version-ago/DIZtools)](https://cran.r-project.org/package=DIZtools)
[![Cran Checks](https://badges.cranchecks.info/worst/DIZtools.svg)](https://cran.r-project.org/web/checks/check_results_DIZtools.html)
[![](http://cranlogs.r-pkg.org/badges/grand-total/DIZtools?color=blue)](https://cran.r-project.org/package=DIZtools)
[![](http://cranlogs.r-pkg.org/badges/last-month/DIZtools?color=blue)](https://cran.r-project.org/package=DIZtools)
[![Dependencies](https://tinyverse.netlify.com/badge/DIZtools)](https://cran.r-project.org/package=DIZtools)
[![R CMD Check via {tic}](https://github.com/miracum/misc-diztools/workflows/R%20CMD%20Check%20via%20{tic}/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![linting](https://github.com/miracum/misc-diztools/workflows/lint/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![test-coverage](https://github.com/miracum/misc-diztools/workflows/test-coverage/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![codecov](https://codecov.io/gh/miracum/misc-diztools/branch/main/graph/badge.svg)](https://app.codecov.io/gh/miracum/misc-diztools)
<!-- badges: end -->

The R package `DIZtools` provides utility functions used for the R package development infrastructure inside the data integration centers ('DIZ') to standardize and facilitate repetitive tasks such as setting up a database connection or issuing notification messages and to avoid redundancy.

:bulb: `DIZtools` contains all "lightweighted" functions of [`DIZutils`](https://github.com/miracum/misc-dizutils) making it a lot quicker to install, while [`DIZutils`](https://github.com/miracum/misc-dizutils) has a lot of dependencies and system requirements.

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

### setenv_file

In order to set up a database connection using the function `DIZutils::db_connection`, one needs to provide the required connection settings via environment variables. To facilitate the process of making such environment variables available within the current R session, the function `DIZtools::setenv_file` works as a wrapper function around the base R method `Sys.setenv`. It takes the file name of a text file with the definitions of the environment variables as input, and sets those environment variables within the current R session.

```r
DIZtools::setenv_file("path/to/envfile")
```

The design of the `envfile` is based on the `.env` file for defining environment variables when using docker-compose commands. See [here](https://docs.docker.com/compose/env-file/) (currently, neither empty lines nor the using of comments ('#') is being supported by `DIZtools::setenv_file`).

To create an `envfile` for connecting with an i2b2 database, the following exemplary definitions of environment variables should be written to a simple textfile, e.g. named `envfile`, which can then be passed as argument to `DIZtools::setenv_file`.

```bash
I2B2_HOST=123.45.56.8
I2B2_PORT=5432
I2B2_DBNAME=i2b2
I2B2_USER=user
I2B2_PASSWORD=password
```

## More Infos

* about MIRACUM: <https://www.miracum.org/>
* about the Medical Informatics Initiative: <https://www.medizininformatik-initiative.de/de/start>
