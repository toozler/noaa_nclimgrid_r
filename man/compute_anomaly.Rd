% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{compute_anomaly}
\alias{compute_anomaly}
\title{Compute anomaly between two datasets}
\usage{
compute_anomaly(nclimgrid_data_a, nclimgrid_data_b)
}
\arguments{
\item{nclimgrid_data_a}{Data frame with nClimGrid data, generated by \code{get_nclimgrid_monthly()} or \code{get_nclimgrid_normals()}}

\item{nclimgrid_data_b}{Data frame with nClimGrid data, generated by \code{get_nclimgrid_monthly()} or \code{get_nclimgrid_normals()}}
}
\value{
Data frame with anomaly. Attributes are inherited from dataset "a".
}
\description{
The anomaly is computed by subtracting the values in dataset "b" from dataset "a".
Only the months in dataset "a" are kept if not available in dataset "b".
}
