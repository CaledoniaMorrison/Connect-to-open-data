### This script builds the form which is used to select the main output

output$main_input_form <- renderUI({
  fluidRow(
    column(width=3,
           selectInput(inputId = "resource_category",label = "Select Category",
                       choices = resource_categories)),
    column(width=4, uiOutput("select_sub_cat")),
    column(width = 3,
           selectInput(inputId="output_type", label = "Select Output Type",
                       choices = "Data Table"))
  )
})

sub_cats <- reactive({
  resource_lookup %>%
    filter(resource_category == input$resource_category)
})

output$select_sub_cat <- renderUI({selectInput(inputId = "resource_desc",
                                     label = "Select Sub Category",
                                     choices = sub_cats()$resource_description)})