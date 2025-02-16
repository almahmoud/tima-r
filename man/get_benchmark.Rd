% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_benchmark.R
\name{get_benchmark}
\alias{get_benchmark}
\title{Get benchmark}
\usage{
get_benchmark(
  url = paths$urls$benchmarking_set,
  export = paths$data$source$benchmark$set
)
}
\arguments{
\item{url}{Character string containing the URL of the benchmarking set}

\item{export}{Character string containing the file path where the benchmarking set should be exported}
}
\description{
This function gets the spectra used for the benchmark
}
\examples{
get_benchmark(url = "https://raw.githubusercontent.com/matchms/matchms/master/tests/massbank_five_spectra.msp", export = "data/source/benchmark/set.csv")
}
