% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/acs_5yr_download.R
\name{get_code_from_area_name}
\alias{get_code_from_area_name}
\alias{get_code_from_area_name.acs_5yr}
\title{Get code from area name}
\usage{
get_code_from_area_name(ac, area)

\method{get_code_from_area_name}{acs_5yr}(ac, area)
}
\arguments{
\item{ac}{An \code{acs_5yr} object.}

\item{area}{A string, area name.}
}
\value{
A vector, area code.
}
\description{
Obtain the code that appears in the name of the file associated with the area.
}
\examples{

dir <- system.file("extdata/acs_5yr", package = "geogenr")
ac <- acs_5yr(dir)

code <- ac |>
  get_code_from_area_name(area = "State")

}
\seealso{
Other information functions: 
\code{\link{get_name_from_area_code}()}
}
\concept{information functions}
