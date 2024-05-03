library(europepmc)

# NIH
query_nih = '(GRANT_AGENCY:"NIH" OR GRANT_AGENCY:"N.I.H." OR PUB_TYPE:"Research Support, N.I.H., Intramural" OR PUB_TYPE:"Research Support, N.I.H., Extramural") AND (PUB_TYPE:"Clinical Trial" OR PUB_TYPE:"Clinical Trial, Phase I" OR PUB_TYPE:"Clinical Trial, Phase II" OR PUB_TYPE:"Clinical Trial, Phase III" OR PUB_TYPE:"Clinical Trial, Phase IV" OR PUB_TYPE:"Randomized Controlled Trial")'

db_nih = epmc_search(query = query_nih, 
                      limit = 1000000,
                      verbose = F)

write.csv(db_nih, "db_nih.csv")

### Removing "PMC" from the cells
db_nih$pmcid_ <-
  gsub("PMC", "", as.character(db_nih$pmcid))


### Now, we make a folder for xml format articles and switch to that folder:
setwd("pmc_nih")

### Next, we download xmls in format accessible with rtransparent. To skip 
### errors (i.e., The metadata format 'pmc' is not supported by the item or by 
### the repository.), first define a new function:
library(metareadr)
skipping_errors <- function(x) tryCatch(mt_read_pmcoa(x), error = function(e) e)

### And then run the function:
sapply(db_nih$pmcid_, skipping_errors)

# CIHR
query_cihr = '(GRANT_AGENCY:"CIHR" OR GRANT_AGENCY:"Canadian Institutes of Health Research") AND (PUB_TYPE:"Clinical Trial" OR PUB_TYPE:"Clinical Trial, Phase I" OR PUB_TYPE:"Clinical Trial, Phase II" OR PUB_TYPE:"Clinical Trial, Phase III" OR PUB_TYPE:"Clinical Trial, Phase IV" OR PUB_TYPE:"Randomized Controlled Trial")'

db_cihr = epmc_search(query = query_cihr, 
                      limit = 1000000,
                      verbose = F)

write.csv(db_cihr, "db_cihr.csv")

db_cihr$pmcid_ <-
  gsub("PMC", "", as.character(db_cihr$pmcid))

setwd("..")
setwd("pmc_cihr")

sapply(db_cihr$pmcid_, skipping_errors)


# NIHR
query_nihr = '(GRANT_AGENCY:"NIHR" OR GRANT_AGENCY:"National Institute for Health and Care Research") AND (PUB_TYPE:"Clinical Trial" OR PUB_TYPE:"Clinical Trial, Phase I" OR PUB_TYPE:"Clinical Trial, Phase II" OR PUB_TYPE:"Clinical Trial, Phase III" OR PUB_TYPE:"Clinical Trial, Phase IV" OR PUB_TYPE:"Randomized Controlled Trial")'

db_nihr = epmc_search(query = query_nihr, 
                      limit = 1000000,
                      verbose = F)

write.csv(db_nihr, "db_nihr.csv")

db_nihr$pmcid_ <-
  gsub("PMC", "", as.character(db_nihr$pmcid))

setwd("..")
setwd("pmc_nihr")

sapply(db_nihr$pmcid_, skipping_errors)

# NHMRC
query_nhmrc = '(GRANT_AGENCY:"NHMRC" OR GRANT_AGENCY:"National Health and Medical Research Council") AND (PUB_TYPE:"Clinical Trial" OR PUB_TYPE:"Clinical Trial, Phase I" OR PUB_TYPE:"Clinical Trial, Phase II" OR PUB_TYPE:"Clinical Trial, Phase III" OR PUB_TYPE:"Clinical Trial, Phase IV" OR PUB_TYPE:"Randomized Controlled Trial")'

db_nhmrc = epmc_search(query = query_nhmrc, 
                      limit = 1000000,
                      verbose = F)

write.csv(db_nhmrc, "db_nhmrc.csv")

db_nhmrc$pmcid_ <-
  gsub("PMC", "", as.character(db_nhmrc$pmcid))

setwd("..")
setwd("pmc_nhmrc")

sapply(db_nhmrc$pmcid_, skipping_errors)


