
navbarPage("Connect to Open Data",
           
           tabPanel("Data",

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
                selectInput(inputId = "resource",label = "Select Output",
                            choices = resource_lookup$resource_description)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           dataTableOutput("output_table")
        )
    )
)
)
