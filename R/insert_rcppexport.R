#' Insert a Rcpp::export command.
#' @description Insert \code{// [[Rcpp::export]]}.
#' @import rstudioapi
#' @importFrom stringr str_detect
insert_rcppexport <- function(){

  line <- getActiveDocumentContext()$selection[[1]]$range$start[1]
  text_line <- getActiveDocumentContext()$contents[line]

  if(str_detect(text_line, "^(\\h)*$")){ # If line is "" or horizontal whitespace
    text <- "// [[Rcpp::export]]"
  } else {
    text <- "// [[Rcpp::export]]\n"
  }

  range <- document_range(c(line, 0), c(line, 0))
  insertText(range, text)
}
