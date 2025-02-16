#' @title Form adducts positive
#'
#' @description This function forms positive adducts
#'
#' @param massesTable Table containing the masses of the adducts
#' @param adductsTable Table containing the adducts
#'
#' @return NULL
#'
#' @export
#'
#' @importFrom dplyr all_of everything mutate select
#' @importFrom tidyr pivot_longer
#'
#' @examples NULL
form_adducts_pos <- function(massesTable, adductsTable) {
  ## Calculate the masses for various positive adducts
  adducts_pos <- massesTable |>
    dplyr::mutate(
      pos_3_3proton = (exact_mass + 3 * proton) / 3,
      pos_3_2proton1sodium = (exact_mass + 2 * proton + sodium) / 3,
      pos_3_1proton2sodium = (exact_mass + proton + 2 * sodium) / 3,
      pos_3_3sodium = (exact_mass + 3 * sodium) / 3,
      pos_2_2proton = (exact_mass + 2 * proton) / 2,
      pos_2_2proton1ammonium = (exact_mass + 2 * proton + ammonium) / 2,
      pos_2_1proton1sodium = (exact_mass + proton + sodium) / 2,
      pos_2_1magnesium = (exact_mass + magnesium) / 2,
      pos_2_1proton1potassium = (exact_mass + proton + potassium) / 2,
      pos_2_1calcium = (exact_mass + calcium) / 2,
      pos_2_2proton1acetonitrile = (exact_mass + 2 * proton + acetonitrile) / 2,
      pos_2_2sodium = (exact_mass + 2 * sodium) / 2,
      pos_2_1iron = (exact_mass + iron) / 2,
      pos_2_2proton2acetonitrile = (exact_mass + 2 * proton + 2 * acetonitrile) / 2,
      pos_2_2proton3acetonitrile = (exact_mass + 2 * proton + 3 * acetonitrile) / 2,
      # pos_1_minus2water1proton = exact_mass - 2 * water + proton,
      # pos_1_minus1water1proton = exact_mass - water + proton,
      pos_1_1proton = exact_mass + proton,
      # pos_1_minus1water1sodium = exact_mass - water + sodium,
      pos_1_1proton1ammonium = exact_mass + proton + ammonium,
      pos_1_1sodium = exact_mass + sodium,
      pos_1_minus1proton1magnesium = exact_mass - proton + magnesium,
      pos_1_1proton1methanol = exact_mass + proton + methanol,
      pos_1_1potassium = exact_mass + potassium,
      pos_1_minus1proton1calcium = exact_mass - proton + calcium,
      pos_1_1proton1acetonitrile = exact_mass + proton + acetonitrile,
      pos_1_minus1proton2sodium = exact_mass - proton + 2 * sodium,
      pos_1_1proton1ethylamine = exact_mass + proton + ethylamine,
      pos_1_minus1proton1iron = exact_mass - proton + iron,
      pos_1_1proton1isopropanol = exact_mass + proton + isopropanol,
      pos_1_1sodium1acetonitrile = exact_mass + sodium + acetonitrile,
      pos_1_minus1proton2potassium = exact_mass - proton + 2 * potassium,
      pos_1_1proton1dmso = exact_mass + proton + dmso,
      pos_1_1proton2acetonitrile = exact_mass + proton + 2 * acetonitrile,
      # pos_IsoPNa-H = exact_mass - proton + isopropanol + sodium)
      pos_2MMg = (2 * exact_mass + magnesium) / 2,
      pos_2MCa = (2 * exact_mass + calcium) / 2,
      pos_2MFe = (2 * exact_mass + iron) / 2,
      pos_2MH = 2 * exact_mass + proton,
      pos_2MHNH3 = 2 * exact_mass + proton + ammonium,
      pos_2MNa = 2 * exact_mass + sodium,
      pos_2MK = 2 * exact_mass + potassium,
      pos_2MHCH3CN = 2 * exact_mass + proton + acetonitrile,
      pos_2MCH3CNNa = 2 * exact_mass + acetonitrile + sodium
    ) |>
    dplyr::select(-colnames(adductsTable))

  n <- ncol(adducts_pos)

  ## Pivot the adducts_pos table to get a long format with adduct and adduct mass as columns
  adducts_pos <- adducts_pos |>
    tidyr::pivot_longer(2:dplyr::all_of(n)) |>
    dplyr::select(dplyr::everything(),
      adduct = name,
      adduct_mass = value
    )

  return(adducts_pos)
}
