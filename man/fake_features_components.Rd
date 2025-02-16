% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fake_features_components.R
\name{fake_features_components}
\alias{fake_features_components}
\title{Fake features components}
\usage{
fake_features_components(
  input = params$input,
  features = params$features,
  output = params$output,
  ms_mode = params$mode,
  name_rt = params$rt_name,
  name_mz = params$precursor_name
)
}
\arguments{
\item{input}{Path to the file containing the input data}

\item{features}{Path to the file containing the features data}

\item{output}{Path to the file to export the merged data to}

\item{ms_mode}{Mode of mass spectrometry, either "pos" or "neg"}

\item{name_rt}{Name of the retention time column in the features data}

\item{name_mz}{Name of the m/z column in the features data}
}
\description{
This function fakes features components in case none are given
}
\examples{
NULL
}
