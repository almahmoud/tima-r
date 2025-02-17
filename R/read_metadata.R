#' @title Read metadata
#'
#' @description This function reads the metadata table from GNPS
#'
#' @param id Character string containing a GNPS job ID
#'
#' @return Data frame containing the metadata for the specified GNPS job
#'
#' @export
#'
#' @importFrom readr read_delim
#' @importFrom stringr str_length
#'
#' @examples NULL
read_metadata <- function(id) {
  # Check if the input is a valid GNPS job ID
  stopifnot("Your job ID is invalid" = stringr::str_length(string = id) == 32)

  # Construct the URL for the metadata file
  file <-
    paste0(
      "https://gnps.ucsd.edu/ProteoSAFe/DownloadResultFile?task=",
      id,
      "&block=main&file=metadata_table/"
    )

  # Read and return the metadata file as a data frame
  return(readr::read_delim(file = file))
}
