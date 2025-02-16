#' @title Read features
#'
#' @description This function reads the features table from GNPS
#'
#' @param id Character string containing a GNPS job ID
#'
#' @return Data frame containing the features for the specified GNPS job
#'
#' @export
#'
#' @importFrom readr read_delim
#' @importFrom stringr str_length
#'
#' @examples NULL
read_features <- function(id) {
  # Check if the length of the ID is 32 characters
  stopifnot("Your job ID is invalid" = stringr::str_length(string = id) == 32)

  # Construct the URL for the features file
  file <- paste0(
    "https://gnps.ucsd.edu/ProteoSAFe/DownloadResultFile?",
    "task=",
    id,
    "&block=main&file=quantification_table_reformatted/"
  )

  # Read the file and return the resulting data frame
  return(readr::read_delim(file = file))
}
