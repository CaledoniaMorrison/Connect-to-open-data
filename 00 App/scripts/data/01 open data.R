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
    
    ## read json
    json_file <- read_json(http_main)
    results<- json_file$result
    
    # parse json
    
    #fields
    fields <- unlist(results$fields, use.names = TRUE)
    fields <- fields[names(fields) == "id"]
    
    # records
    records <- unlist(results$records, recursive = FALSE)
    
    parse <- function(field) {
      records[names(records) == field]
    }
    
    data <- sapply(fields, parse) %>% as.data.frame()
    names(data) <- fields
    row.names(data) <- as.character(1:nrow(data))
    
    data
  
  }
