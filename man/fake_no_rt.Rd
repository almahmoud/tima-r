% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fake_no_rt.R
\name{fake_no_rt}
\alias{fake_no_rt}
\title{Fake no retention time}
\usage{
fake_no_rt(
  input = paths$data$interim$annotations$example_feature_table,
  output = paths$data$interim$annotations$example_feature_table_no_rt
)
}
\arguments{
\item{input}{File path of the input feature table}

\item{output}{File path of the output feature table with no retention time column}
}
\description{
This function fakes retention times in case none are given
}
\examples{
NULL
}
