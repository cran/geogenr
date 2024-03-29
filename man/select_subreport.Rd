% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/acs_5yr_topic.R
\name{select_subreport}
\alias{select_subreport}
\alias{select_subreport.acs_5yr_topic}
\title{Select subreport}
\usage{
select_subreport(act, subreport)

\method{select_subreport}{acs_5yr_topic}(act, subreport = NULL)
}
\arguments{
\item{act}{An \code{acs_5yr_topic} object.}

\item{subreport}{A string vector, subreport names.}
}
\value{
A vector, topic name.
}
\description{
Select the subreports whose names are indicated. We reduce the available
subreports and variables to those of the selected subreports.
}
\examples{

act2 <- anrc_2021_x01 |>
  select_subreport(
    c(
      "B01002-B-Median Age By Sex (Black Or African American Alone)",
      "B01002-C-Median Age By Sex (American Indian And Alaska Native Alone)"
    )
  )

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
\code{\link{get_topic_name}()},
\code{\link{select_report}()},
\code{\link{select_topic}()}
}
\concept{data selection functions}
