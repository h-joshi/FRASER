% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getNSetterFuns.R
\name{verbose}
\alias{verbose}
\alias{verbose<-}
\title{Verbosity level of the FraseR package}
\usage{
verbose(fds)

verbose(fds) <- value
}
\arguments{
\item{fds}{FraseRDataSet}

\item{value}{The level of verbosity, between 0 and 10. TRUE/FALSE are also 
accepted.}
}
\value{
numeric(1) (getter) or FraseRDataSet (setter)
}
\description{
Dependend on the level of verbosity the algorithm reports more or less to
the user. 0 means being quiet and 10 means everything.
}
\examples{
fds <- createTestFraseRSettings()
verbose(fds)

verbose(fds) <- 2
verbose(fds)

}
