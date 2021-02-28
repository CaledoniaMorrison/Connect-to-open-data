
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  data <- reactive({
    resource_id <- filter(resource_lookup, resource_description == input$resource) %>%
      pull(resource_id)
    get_data(resource_id = resource_id)
  })
  
  output$output_table <- renderDataTable({
    data()
  })
    
}
