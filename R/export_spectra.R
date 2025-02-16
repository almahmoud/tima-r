#' @title Export spectra
#'
#' @description This function prepares spectra for export
#'
#' @param file File where spectra will be exported. Can be '.mgf' or '.sqlite'
#' @param spectra The spectra object where spectra are stored
#' @param dir Directory for export
#' @param cmps Optional. Compounds data frame as in 'CompoundDb' package
#' @param metad Optional. Metadata as in 'CompoundDb' package
#'
#' @return NULL
#'
#' @export
#'
#' @importFrom CompoundDb createCompDb
#' @importFrom MsBackendMgf MsBackendMgf
#' @importFrom Spectra export Spectra
#'
#' @examples NULL
export_spectra <- function(file,
                           spectra,
                           dir = ".",
                           cmps = NULL,
                           metad = NULL) {
  switch(
    EXPR = gsub(
      pattern = ".*\\.",
      replacement = "",
      x = file
    ),
    "mgf" = {
      Spectra::Spectra(object = spectra) |>
        Spectra::export(
          backend = MsBackendMgf::MsBackendMgf(),
          file = file
        )
    },
    "sqlite" = {
      if (is.null(cmps)) {
        cmps <-
          data.frame(
            compound_id = if (!is.null(spectra$compound_id)) {
              spectra$compound_id
            } else {
              no <- rep(
                NA,
                nrow(spectra)
              )
            },
            name = if (!is.null(spectra$name)) {
              spectra$name
            } else {
              no <- rep(
                NA,
                nrow(spectra)
              )
            },
            inchi = if (!is.null(spectra$inchi)) {
              spectra$inchi
            } else {
              no <- rep(
                NA,
                nrow(spectra)
              )
            },
            inchikey = if (!is.null(spectra$inchikey)) {
              spectra$inchikey
            } else {
              no <- rep(
                NA,
                nrow(spectra)
              )
            },
            exactmass = if (!is.null(spectra$exactmass)) {
              spectra$exactmass
            } else {
              no <- rep(
                NA_integer_,
                nrow(spectra)
              )
            },
            formula = if (!is.null(spectra$formula)) {
              spectra$formula
            } else {
              no <- rep(
                NA,
                nrow(spectra)
              )
            },
            synonyms = if (!is.null(spectra$synonyms)) {
              spectra$synonyms
            } else {
              no <- rep(
                NA,
                nrow(spectra)
              )
            }
          )
      }
      if (is.null(metad)) {
        metad <-
          data.frame(
            name = c(
              "source",
              "url",
              "source_version",
              "source_date",
              "organism"
            ),
            value = c(
              NA,
              NA,
              0,
              Sys.time() |>
                as.character(),
              NA
            )
          )
      }

      CompoundDb::createCompDb(
        x = cmps,
        metadata = metad,
        msms_spectra = spectra,
        path = dir,
        dbFile = file
      )
    }
  )
}

#' @title Export spectra 2
#'
#' @description This function export spectra.
#'
#' @param file File where spectra will be exported. Can be '.mgf' or '.sqlite'
#' @param spectra The spectra object where spectra are stored
#' @param meta Optional. Metadata as in 'CompoundDb' package
#'
#' @return NULL
#'
#' @export
#'
#' @importFrom tidyr drop_na
#'
#' @examples NULL
export_spectra_2 <- function(file,
                             spectra,
                             meta) {
  log_debug("Exporting")
  create_dir(export = file)
  if (nrow(spectra |>
    tidyr::drop_na(compound_id)) != 0) {
    spectra |>
      export_spectra(
        file = file,
        metad = meta
      )
  } else {
    log_debug(
      "There is already a library with the same name existing, to avoid any conflict please remove it."
    )
  }
}
