getXML <- function(ptyp) {
  require(rentrez)
  require(XML)
  es <- entrez_search("pubmed", paste(ptyp, "[PTYP]", sep = ""), use_history = TRUE)
#  ef <- entrez_fetch("pubmed", WebEnv = es$WebEnv, query_key = es$QueryKey, retmax = es$count, rettype = "xml")
   ef <- entrez_fetch("pubmed", web_history = es$web_history, retmax = es$count, rettype = "xml")
  return(ef)
}

setwd("~/Dropbox/projects/pubmed/retractions/data/")

## retracted
retracted <- getXML("\"Retracted Publication\"")
writeLines(retracted, "retracted.xml")
## retraction of
retraction <- getXML("\"Retraction of Publication\"")
writeLines(retraction, "retractionOf.xml")
