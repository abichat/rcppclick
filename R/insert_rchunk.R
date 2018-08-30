#' Insert a R chunk.
#' @description Insert
#'
#' \code{/*** R}
#'
#' \code{*/}
#' @import rstudioapi
#'
insert_rchunk <- function(){
  text <- "/*** R\n\n*/\n"
  range <- document_range(c(1, 0), c(1, 0))
  insertText(range, text)
}
