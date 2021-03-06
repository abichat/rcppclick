#' Remove all R chunks.
#' @description Remove all R chunks present in the current document.
#' @details Does not remove anything if nested chunks are detected or if some chunks are opened but not closed (and reciprocally).
#' @importFrom rstudioapi getActiveDocumentContext modifyRange
remove_rchunks <- function(){
  script <- getActiveDocumentContext()$contents
  list <- get_chunks_lines(script)

  if (!is.null(list)) {
    borders <- unlist(Map(range, list))
    if(any(borders != sort(borders))){
      cat("There are nested chunks.\n")
    } else {
      rng <- Map(function(x) c(x[1], 1, x[length(x)], Inf), list)
      modifyRange(rng, "")
    }
  }
}
