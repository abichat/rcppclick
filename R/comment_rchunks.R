#' Comment all R chunks.
#' @description Comment all R chunks present in the current document.
#' @details Does not comment already commented lines.
#' Does not comment anything if some chunks are opened but not closed (and reciprocally).
#' @importFrom rstudioapi getActiveDocumentContext insertText
#' @importFrom stringr str_which
comment_rchunks <- function(){

  script <- getActiveDocumentContext()$contents
  list <- get_chunks_lines(script)
  lines_commented <- str_which(script, "^#")

  if (!is.null(list)) {

    lines <- unlist(lapply(list, function(x) x[-c(1, length(x))]))
    lines_to_comment <- setdiff(lines, lines_commented)

    if(length(lines_to_comment) > 0){

      pos <- Map(c, lines_to_comment, 1)
      insertText(pos, "# ")

    }
  }
}
