\name{aidb_read}
\alias{aidb_read}
\alias{aidb_tables}
\title{Read an open table on the AI training data market}
\description{
Downloads one of the open datasets published by AIData.Broker at
\url{https://aidata.broker/datasets}: public prices for AI training data,
licensing deals, buyers, vendors, lawsuits and related tables. Each row keeps
the source link, the publication date and, where one exists, the source's own
words. The data are licensed CC BY 4.0.
}
\usage{
aidb_tables()
aidb_read(name = "prices")
}
\arguments{
\item{name}{The table to read, one of \code{aidb_tables()}.}
}
\value{
\code{aidb_tables()} returns a character vector of table names.
\code{aidb_read()} returns a data frame with one row per record.
}
\examples{
aidb_tables()
\donttest{
prices <- aidb_read("prices")
nrow(prices)
}
}
