
library(shiny)
library(tidyverse)
library(shinyjs)
library(DT)

resource_lookup <- readRDS("scripts/data/resource_lookup.RDS")
resource_categories <- unique(resource_lookup$resource_category)

source("scripts/data/01 open data.R")