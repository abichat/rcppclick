
#' Exctract R chunks lines numbers.
#' @ Exctract the R chunks lines numbers as a list.
#' @return The list of lines numbers. Each element represent a chunk.
#' @import rstudioapi
#' @importFrom stringr str_which
get_chunks_lines <- function(script){

  l_open <- str_which(script, "^/\\*\\*\\* R")
  l_end <- str_which(script, "^\\*/")

  if(length(l_open) != length(l_end)){
    cat("There is not the same number of /*** R and */.\n")
    return(NULL)
  } else {
    return(Map(seq, l_open, l_end))
  }
}
