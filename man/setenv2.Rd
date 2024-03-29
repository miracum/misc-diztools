% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setenv2.R
\name{setenv2}
\alias{setenv2}
\title{Assign variables to the system environment.}
\usage{
setenv2(key, val)
}
\arguments{
\item{key}{A character (!) string. The name of the assigned variable}

\item{val}{An object. The object that will be assigned to 'key'.}
}
\value{
No return value, called for side effects (see description).
}
\description{
Create a system environment variable with the use of variables.
  While `var.name = "testname"; var.value = 7` and
  `Sys.setenv(var.name = var.value)` will create
  `var.name = 7` in the system environment,
  `DIZtools::setenv2(key = var.name, val = var.value)` will create
  `testname = 7` in the system environment.
}
\examples{
  var.name = "testname"
  var.value = 7

  Sys.setenv(var.name = var.value)

  Sys.getenv("testname")
  #> [1] ""
  Sys.getenv("var.name")
  #> [1] "7"

  Sys.unsetenv("var.name")
  Sys.unsetenv("testname")

  setenv2(key = var.name, val = var.value)
  Sys.getenv("testname")
  #> [1] "7"
  Sys.getenv("var.name")
  #> [1] ""

}
\seealso{
\url{https://stackoverflow.com/a/12533155}
}
