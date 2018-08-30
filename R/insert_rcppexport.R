
#' Insert a Rcpp::export command.
#' @description Insert \code{// [[Rcpp::export]]}.
#' @import rstudioapi
insert_rcppexport <- function(){
  text <- "// [[Rcpp::export]]\n"
  range <- document_range(c(1, 0), c(1, 0))
  insertText(range, text)
}
