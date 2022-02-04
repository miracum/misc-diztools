# DIZtools

<!-- badges: start -->
[![R CMD Check via {tic}](https://github.com/miracum/misc-diztools/workflows/R%20CMD%20Check%20via%20{tic}/badge.svg?branch=master)](https://github.com/miracum/misc-diztools)
[![linting](https://github.com/miracum/misc-diztools/workflows/lint/badge.svg?branch=master)](https://github.com/miracum/misc-diztools)
[![test-coverage](https://github.com/miracum/misc-diztools/workflows/test-coverage/badge.svg?branch=master)](https://github.com/miracum/misc-diztools)
[![codecov](https://codecov.io/gh/miracum/misc-diztools/branch/master/graph/badge.svg)](https://app.codecov.io/gh/miracum/misc-diztools)
[![pipeline status](https://gitlab.miracum.org/miracum/misc/diztools/badges/master/pipeline.svg)](https://gitlab.miracum.org/miracum/misc/diztools/-/commits/master)
[![coverage report](https://gitlab.miracum.org/miracum/misc/diztools/badges/master/coverage.svg)](https://gitlab.miracum.org/miracum/misc/diztools/-/commits/master)
[![CRAN Status Badge](https://www.r-pkg.org/badges/version-ago/DIZtools)](https://cran.r-project.org/package=DIZtools)
[![Cran Checks](https://cranchecks.info/badges/worst/DIZtools)](https://cran.r-project.org/web/checks/check_results_DIZtools.html)
<!-- badges: end -->

The R package `DIZtools` provides utility functions used for the R package development infrastructure inside the data integration centers ('DIZ') to standardize and facilitate repetitive tasks such as setting up a database connection or issuing notification messages and to avoid redundancy.

:bulb: `DIZtools` contains all "lightweighted" functions of `DIZutils` making it a lot easier to install, while `DIZutils` has a lot of dependencies and system requirements.

## Installation

<!-- You can install `DIZtools` directly from CRAN:

```r
install.packages("DIZtools")
``` -->

The development version can be installed using

```r
install.packages("remotes")
remotes::install_github("miracum/misc-diztools", ref = "development")
```

## More Infos

* about MIRACUM: <https://www.miracum.org/>
* about the Medical Informatics Initiative: <https://www.medizininformatik-initiative.de/index.php/de>
