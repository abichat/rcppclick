#' Uncomment all R chunks.
#' @description Uncomment all commented R chunks present in the current document.
#' @details Does not uncomment anything if some chunks are opened but not closed (and reciprocally).
#' @importFrom rstudioapi getActiveDocumentContext modifyRange
#' @importFrom stringr str_which
uncomment_rchunks <- function(){

  script <- getActiveDocumentContext()$contents
  list <- get_chunks_lines(script)
  lines_commented1 <- str_which(script, "^#")
  lines_commented2 <- str_which(script, "^# ")
  lines_commented1 <- setdiff(lines_commented1, lines_commented2)

  if (!is.null(list)) {

    lines <- unlist(lapply(list, function(x) x[-c(1, length(x))]))
    lines_to_uncomment1 <- intersect(lines, lines_commented1)
    lines_to_uncomment2 <- intersect(lines, lines_commented2)

    if(length(lines_to_uncomment1) > 0){

      rng1 <- Map(c, lines_to_uncomment1, 1, lines_to_uncomment1, 2)
      modifyRange(rng1, "")
    }
    if(length(lines_to_uncomment2) > 0){

      rng2 <- Map(c, lines_to_uncomment2, 1, lines_to_uncomment2, 3)
      modifyRange(rng2, "")
    }
  }
}
