#' @keywords internal
.aidb_base <- "https://aidata.broker/datasets"

aidb_tables <- function() {
  c("prices", "market-rates", "negotiation-levers", "supply", "deals", "buyers",
    "vendors", "cases", "funding", "financials", "market-log", "software-terms",
    "rights-checks", "licence-terms", "ai-crawler-census", "rankings", "companies")
}

aidb_read <- function(name = "prices", key = Sys.getenv("AIDATABROKER_KEY")) {
  if (!is.character(name) || length(name) != 1L || !(name %in% aidb_tables())) {
    stop("'name' must be one of: ", paste(aidb_tables(), collapse = ", "), call. = FALSE)
  }
  if (!is.character(key) || length(key) != 1L || !nzchar(key)) {
    stop("The tables are sold under AIData.Broker's Market Data Licence. Set the ",
         "environment variable AIDATABROKER_KEY to the licence's API key, or pass ",
         "'key'. The licence and its terms: https://aidata.broker/datasets", call. = FALSE)
  }
  con <- url(sprintf("%s/%s.csv", .aidb_base, name),
             headers = c(Authorization = paste("Bearer", key)))
  on.exit(close(con))
  out <- tryCatch(
    utils::read.csv(con, stringsAsFactors = FALSE, check.names = FALSE, encoding = "UTF-8"),
    error = function(e) {
      stop("Could not read the '", name, "' table: ", conditionMessage(e),
           ". A key that is not valid, or a licence that has ended, is refused; ",
           "see https://aidata.broker/datasets", call. = FALSE)
    }
  )
  out
}
