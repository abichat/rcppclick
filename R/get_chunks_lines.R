#' Exctract R chunks lines numbers.
#' @description Exctract the R chunks lines numbers as a list.
#' @param script The contents of the document.
#' @return A list of lines numbers. Each element represent the line numbers of a chunk.
#' Returns \code{NULL} if some chunks are opened but not closed (and reciprocally).
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
