#' @keywords internal
.aidb_base <- "https://aidata.broker/datasets"

aidb_tables <- function() {
  c("prices", "market-rates", "negotiation-levers", "supply", "deals", "buyers",
    "vendors", "cases", "funding", "financials", "market-log", "software-terms",
    "rights-checks", "licence-terms", "companies")
}

aidb_read <- function(name = "prices") {
  if (!is.character(name) || length(name) != 1L || !(name %in% aidb_tables())) {
    stop("'name' must be one of: ", paste(aidb_tables(), collapse = ", "))
  }
  utils::read.csv(sprintf("%s/%s.csv", .aidb_base, name), stringsAsFactors = FALSE,
                  check.names = FALSE, encoding = "UTF-8")
}
