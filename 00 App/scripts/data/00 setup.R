## Update existing lookup
lookup <- read.csv("scripts/data/resource_lookup.csv")
saveRDS(lookup, "scripts/data/resource_lookup.RDS")

## This script will prepare the urls for the open data functions

url<-"https://www.opendata.nhs.scot/dataset/weekly-covid-19-statistical-data-in-scotland"

library(rvest)
library(tidyverse)

read_html(url) %>% View()
resource_id <- read_html(url) %>%
  html_nodes(xpath = '//*[@id="dataset-resources"]/ul')  %>%
  html_children() %>%
  as.vector() %>%
  substr(36,71)
resource_description <- character()
for(i in 1:length(resource_id)){
  resource_description[i] <- (read_html(url) %>%
  html_nodes(xpath = paste0('//*[@id="dataset-resources"]/ul/li[',i,']/a'))  %>%
  html_attrs())[[1]][["title"]] 
}

resources<- tibble(resource_id = resource_id,
                   resource_description = resource_description)

saveRDS(resources, "00 App/scripts/data/resource_lookup.RDS")
