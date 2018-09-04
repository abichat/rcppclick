#' Insert a R chunk.
#' @description Insert
#'
#' \code{/*** R}
#'
#' \code{*/}
#' @import rstudioapi
#' @importFrom stringr str_detect
insert_rchunk <- function(){

  line <- getActiveDocumentContext()$selection[[1]]$range$start[1]
  text_line <- getActiveDocumentContext()$contents[line]

  if(str_detect(text_line, "^(\\h)*$")){ # If line is "" or horizontal whitespace
    text <- "/*** R\n\n*/"
  } else {
    text <- "/*** R\n\n*/\n"
  }

  range <- document_range(c(line, 0), c(line, 0))
  insertText(range, text)
}
