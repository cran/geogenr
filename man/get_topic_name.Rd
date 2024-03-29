% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/acs_5yr_topic.R
\name{get_topic_name}
\alias{get_topic_name}
\alias{get_topic_name.acs_5yr_topic}
\title{Get topic name (report groups)}
\usage{
get_topic_name(act)

\method{get_topic_name}{acs_5yr_topic}(act)
}
\arguments{
\item{act}{An \code{acs_5yr_topic} object.}
}
\value{
A vector, topic name.
}
\description{
Get the selected topic by which this object has been defined.
}
\details{
A topic is made up of a set of reports.
}
\examples{

topic <- anrc_2021_x01 |>
  get_topic_name()

}
\seealso{
Other data selection functions: 
\code{\link{as_acs_5yr_topic}()},
\code{\link{get_available_area_topics}()},
\code{\link{get_available_area_years}()},
\code{\link{get_available_areas}()},
\code{\link{get_geo_attribute_names}()},
\code{\link{get_geo_layer.acs_5yr_geo}()},
\code{\link{get_names_of_other_topics}()},
\code{\link{get_report_names}()},
\code{\link{get_subreport_names}()},
\code{\link{select_report}()},
\code{\link{select_subreport}()},
\code{\link{select_topic}()}
}
\concept{data selection functions}
