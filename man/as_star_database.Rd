% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/acs_5yr_rolap.R
\name{as_star_database}
\alias{as_star_database}
\alias{as_star_database.acs_5yr_topic}
\title{As \code{rolap::star_database} object}
\usage{
as_star_database(act, attributes)

\method{as_star_database}{acs_5yr_topic}(act, attributes = NULL)
}
\arguments{
\item{act}{An \code{acs_5yr_topic} object.}

\item{attributes}{A string vector.}
}
\value{
A \code{star_database} object.
}
\description{
Obtain an \code{rolap::star_database} object to be able to export it to a RDBMS and
make queries with other tools.
}
\details{
We can indicate the attributes of the geographic layer to include in the export.
Otherwise, the default attributes are included (not area, perimeter or location
attributes).
}
\examples{

st <- anrc_2021_x01 |>
  as_star_database()

}
\seealso{
Other data exploitation and export functions: 
\code{\link{as_GeoPackage}()},
\code{\link{as_acs_5yr_geo}()},
\code{\link{as_flat_table}()},
\code{\link{as_geomultistar}()},
\code{\link{get_metadata}()},
\code{\link{set_metadata}()}
}
\concept{data exploitation and export functions}
