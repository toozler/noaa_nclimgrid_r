% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{get_nclimgrid_normals}
\alias{get_nclimgrid_normals}
\title{Downloads and formats nClimGrid normals data}
\usage{
get_nclimgrid_normals(
  period = "1901-2000",
  measurement = "tave",
  region = "us",
  wide = FALSE,
  verbose = FALSE
)
}
\arguments{
\item{period}{Normals period. (i.e. "1901-2000" , "1981-2010", "1991-2020", "2006-2020"). Defaults to "1901-2000" (20th Century)}

\item{measurement}{Measurement type (i.e. "tave", "tmax", "tmin", "prcp")}

\item{region}{Region (i.e. "us", "ak")}

\item{wide}{Convert to wide format, default is FALSE}

\item{verbose}{Verbose, default is FALSE}
}
\value{
Data frame
}
\description{
Normals data exist only for predefined periods. To see valid start and end of periods of record, see \code{validate_normals_period()}
}
