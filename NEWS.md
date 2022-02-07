# DIZtools NEWS

## Unreleased (2022-02-07)

#### New Features

* added `logger` for console logging
* added normalizepath to file.path calls
* added option support for `feedback` function
#### Fixes

* example errors and cran check corrections
* mustwork=FALSE to clean_path
* fixed some missing docs; cran checks should work now
#### Refactorings

* reverted to `feedback` instead of `log` (log is the logarithm :facepalm:
* changed `feedback()` to `log()`
#### Docs

* updated spelling
* updated news.md
* updated rep2 function which was ahead in dizutils
#### Others

* first cran submission
* added re-creation of gitignore and buildignore
* added reference to logger in feedback function info
* updated all `feedback` references to `log`
* removed unnecessary dependency to rapportools
* added mustwork-arg to normalizepath
* enhancements to clean-path and log
* added rapportools dependency; fixed śome linting errors
* fixed typo in example caused failing tests
* working on migrating logging functions; fixing errors with normalizepath
* updated readme badge urls
* shiny, shinyjs to suggests; removed call to installed.packages
* updated news.md
* updated licence statements
* towards sufficient cran checks
* first attempt for new package. Testing pending
* first commit
* moved unit tests for logging to diztools
