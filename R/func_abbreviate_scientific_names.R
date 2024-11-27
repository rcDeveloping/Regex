#' Abbreviate Species Names
#'
#' This function takes a full species name (e.g., "Homo sapiens") and 
#' abbreviates it by keeping the first letter of the genus name followed by a
#' period and the full species epithet.
#'
#' @param name A character string representing the full species name to be abbreviated.
#'             The input should contain exactly two words: the genus name and the species epithet.
#'
#' @return A character string with the abbreviated species name in the format 
#'         "G. epithet", where "G" is the first letter of the genus and "epithet" 
#'         is the full species name.
#'
#' @details This function assumes the genus name is capitalized and the species 
#'          epithet is in lowercase. For instance, "Homo sapiens" will be converted 
#'          to "H. sapiens". If the input does not follow this format, the behavior 
#'          may be unexpected.
#' 
#' @examples
#' # Example usage:
#' species_name <- "Homo sapiens"
#' abbreviated_name <- abbreviate_specie(species_name)
#' print(abbreviated_name)  # Output: "H. sapiens"
#' 
#' @importFrom stringr str_replace
#' @export
abbreviate_specie <- function(name) {
    # Check if stringr is installed; if not, install it
    if (!requireNamespace("stringr", quietly = TRUE)) {
        install.packages("stringr")
    }
    # Load the stringr package
    library(stringr)
    
    # Abbreviate the species name
    return(str_replace(name, "(^\\S)(\\S+)(\\s)(\\S+)", "\\1. \\4"))
}
