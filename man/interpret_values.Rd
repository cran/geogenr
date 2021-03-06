% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uscb_metadata_interpret_metadata.R
\name{interpret_values}
\alias{interpret_values}
\title{interpret values}
\usage{
interpret_values(mdr, values, interpret, field_values, other_field)
}
\arguments{
\item{mdr}{A \code{tibble} row.}

\item{values}{A vector of values.}

\item{interpret}{Vector of functions to consider.}

\item{field_values}{A data frame that stores associations between fields and
values.}

\item{other_field}{Included field that can contain the value "other".}
}
\value{
A \code{tibble} row.
}
\description{
Interprets the values in the metadata for a row.
}
\keyword{internal}
