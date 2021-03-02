## Connect with Public Health Scotland Open Data Platform
##
## This script defines functions which will connect to the open data available 
## at https://www.opendata.nhs.scot/
##

## SECTION 1 - Setup ----

## SECTION 2 - High Level Functions ----

get_data <- function(resource_id){
  
  require(jsonlite)
  
  ## get url
    http_main <- paste0("https://www.opendata.nhs.scot/api/3/action/",
                        "datastore_search?resource_id=", resource_id)
    
    n_records <- read_json(http_main)$result$total
    
    http_main <- paste0("https://www.opendata.nhs.scot/api/3/action/",
                        "datastore_search?limit=", n_records, 
                        "&resource_id=", resource_id)
    
    ## read json
    fromJSON(http_main, simplifyDataFrame = TRUE)
    
  }
