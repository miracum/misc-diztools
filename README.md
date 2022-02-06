# DIZtools

<!-- badges: start -->
[![R CMD Check via {tic}](https://github.com/miracum/misc-diztools/workflows/R%20CMD%20Check%20via%20{tic}/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![linting](https://github.com/miracum/misc-diztools/workflows/lint/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![test-coverage](https://github.com/miracum/misc-diztools/workflows/test-coverage/badge.svg?branch=main)](https://github.com/miracum/misc-diztools)
[![codecov](https://codecov.io/gh/miracum/misc-diztools/branch/main/graph/badge.svg)](https://app.codecov.io/gh/miracum/misc-diztools)
[![pipeline status](https://gitlab.miracum.org/miracum/misc/diztools/badges/main/pipeline.svg)](https://gitlab.miracum.org/miracum/misc/diztools/-/commits/main)
[![coverage report](https://gitlab.miracum.org/miracum/misc/diztools/badges/main/coverage.svg)](https://gitlab.miracum.org/miracum/misc/diztools/-/commits/main)
<!--[![CRAN Status Badge](https://www.r-pkg.org/badges/version-ago/DIZtools)](https://cran.r-project.org/package=DIZtools)
[![Cran Checks](https://cranchecks.info/badges/worst/DIZtools)](https://cran.r-project.org/web/checks/check_results_DIZtools.html)-->
<!-- badges: end -->

The R package `DIZtools` provides utility functions used for the R package development infrastructure inside the data integration centers ('DIZ') to standardize and facilitate repetitive tasks such as setting up a database connection or issuing notification messages and to avoid redundancy.

:bulb: `DIZtools` contains all "lightweighted" functions of [`DIZutils`](https://github.com/miracum/misc-dizutils) making it a lot quicker to install, while [`DIZutils`](https://github.com/miracum/misc-dizutils) has a lot of dependencies and system requirements.

## Installation

<!-- You can install `DIZtools` directly from CRAN:

```r
install.packages("DIZtools")
``` -->

The development version can be installed using

```r
install.packages("remotes")
remotes::install_github("miracum/misc-diztools", ref = "dev")
```

## More Infos

* about MIRACUM: <https://www.miracum.org/>
* about the Medical Informatics Initiative: <https://www.medizininformatik-initiative.de/index.php/de>
