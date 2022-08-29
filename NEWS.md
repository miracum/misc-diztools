# DIZtools NEWS

## Unreleased (2022-08-29)

#### New Features

* added new function `number_to_position()`
#### Refactorings

* slightly changed print format output of `get_current_timestamp()`
#### Docs

* updated news
#### Others

* updated gha
* updated gha
* new dev version

Full set of changes: [`v0.0.5...bd90fea`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.5...bd90fea)

## v0.0.5 (2022-05-18)

#### New Features

* added logo
* added function `check_if_unique_rows`
#### Fixes

* `is.empty()` can now handle lists in lists
* importing data.table now for check_if_unique_rows
* feedback function broke after calling `close_all_connections()`
#### Docs

* added default parameter for stop
* updated news
#### Others

* new release `v0.0.5`
* updated news.md
* comment out logo creation to have png-file not altered at every devstuffs run
* updated logo
* added rplots.pdf to rbuildignore
* updated news.md
* merged origin/dev
* updated devstuffs to get auto-changelog working again
* removed console print in case of new logfile
* added `print_invalid_rows` logic to function `check_if_unique_rows`
* updated news md

Full set of changes: [`v0.0.4...v0.0.5`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.4...v0.0.5)

## v0.0.4 (2022-03-03)

#### New Features

* added `trim.space()` and `vgsub()` as functions
* added `is.empty()` function
#### Fixes

* global option now work for feedback
#### Docs

* updated news.md
* updated news.md
#### Others

* updated http --> https
* new release 0.0.4

Full set of changes: [`v0.0.3...v0.0.4`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.3...v0.0.4)

## v0.0.3 (2022-02-24)

#### Refactorings

* moved function `clear()` to new package `cleaR::clear()`
#### Docs

* added badges to readme again
#### Others

* prep for cran release 0.0.3
* updated readme, added examples
* merged dev

Full set of changes: [`v0.0.2...v0.0.3`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.2...v0.0.3)

## v0.0.2 (2022-02-08)

#### Others

* cran version
* added files to rbuildignore

Full set of changes: [`v0.0.1...v0.0.2`](https://gitlab.miracum.org/miracum/misc/diztools/compare/v0.0.1...v0.0.2)

## v0.0.1 (2022-02-07)

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
