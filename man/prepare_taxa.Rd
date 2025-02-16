% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepare_taxa.R
\name{prepare_taxa}
\alias{prepare_taxa}
\title{Prepare taxa}
\usage{
prepare_taxa(
  input = params$input,
  tool = params$tool,
  extension = params$extension,
  colname = params$column_name,
  gnps_job_id = params$gnps,
  metadata = params$metadata,
  top_k = params$top_k,
  output = params$output,
  taxon = params$taxon
)
}
\arguments{
\item{input}{File containing your features intensities}

\item{tool}{Tool from which your file comes from ('manual', 'gnps' or 'ready')}

\item{extension}{Does your colun names contain the file extension? (MZmine mainly)}

\item{colname}{Name of the column containing biological source information}

\item{gnps_job_id}{If your tool is 'gnps', corresponding GNPS job ID}

\item{metadata}{File containing your metadata including biological source}

\item{top_k}{Number of organisms to be retained per feature top intensities}

\item{output}{Output file}

\item{taxon}{If you want to enforce all features to a given taxon, put its name here.}
}
\description{
This function performs taxon name preparation to match the Open Tree of Life taxonomy
}
\details{
Depending if the features are aligned between samples originating from various organisms or not,
It can either attribute all features to a single organism, or attribute them to multiple ones,
according to their relative intensities among the samples.
}
\examples{
NULL
}
