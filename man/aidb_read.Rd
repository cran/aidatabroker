\name{aidb_read}
\alias{aidb_read}
\alias{aidb_tables}
\title{Read a licensed table on the AI training data market}
\description{
Reads one of the tables AIData.Broker keeps on the market for AI training
data: prices, licensing deals, buyers, vendors, lawsuits and related tables.
Each row keeps the source link, the publication date and, where one exists,
the source's own words. Since 11 November 2026 the tables are sold under
AIData.Broker's Market Data Licence, so reading one needs the licence's API
key; see \url{https://aidata.broker/datasets}.
}
\usage{
aidb_tables()
aidb_read(name = "prices", key = Sys.getenv("AIDATABROKER_KEY"))
}
\arguments{
\item{name}{The table to read, one of \code{aidb_tables()}.}
\item{key}{The Market Data Licence's API key. Defaults to the
\code{AIDATABROKER_KEY} environment variable.}
}
\value{
\code{aidb_tables()} returns a character vector of table names.
\code{aidb_read()} returns a data frame with one row per record.
}
\examples{
aidb_tables()
\dontrun{
# With a Market Data Licence key in AIDATABROKER_KEY:
prices <- aidb_read("prices")
nrow(prices)
}
}
