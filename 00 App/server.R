
server <- function(input, output, session) {
  
  ################################################
  ## Data Explorer 
  
  ## input form
  source("scripts/outputs/ui_main_inputs.R", local = TRUE)$value

  ################################################
  
  data <- reactive({
    
    if(length(input$resource_desc == 1)){

    selected_resource <- input$resource_desc

    resource_id <- filter(resource_lookup, resource_description == selected_resource) %>%
      pull(resource_id)
    data <- get_data(resource_id = resource_id)
    data$result$records
    
    }
    
    })

  output$output_table <- renderDataTable({
    data()
  })

}
