% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getNSetterFuns.R, R/AllGenerics.R
\name{K}
\alias{K}
\alias{N}
\alias{counts,FraseRDataSet-method}
\alias{counts<-,FraseRDataSet-method}
\title{Getter/setter for count data}
\usage{
K(fds, type = currentType(fds))

N(fds, type = currentType(fds))

\S4method{counts}{FraseRDataSet}(object, type = NULL, side = c("ofInterest", "otherSide"))

\S4method{counts}{FraseRDataSet}(object, type = NULL, side = c("ofInterest", "otherSide"), ...) <- value
}
\arguments{
\item{fds, object}{FraseRDataSet}

\item{type}{The psi type.}

\item{side}{"ofInterest" for junction counts, "other" for sum of counts of 
all other junctions at the same donor site (psi5) or acceptor site (psi3), 
respectively.}

\item{...}{Further parameters that are passed to assays(object,...)}

\item{value}{An integer matrix containing the counts.}
}
\value{
FraseRDataSet
}
\description{
Getter/setter for count data

setter for count data
}
\examples{
 fds <- createTestFraseRDataSet()
 
 counts(fds, type="psi5", side="ofInterest")
 counts(fds, type="psi5", side="other")
 head(K(fds, type="psi3"))
 head(N(fds, type="psi3"))
 
}
