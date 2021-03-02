tagList(
  useShinyjs(),  # Include shinyjs
  navbarPage(id = "intabset",# id used for jumping between tabs
             title = div(tags$a(img(src="phs-logo.png", width=120, alt = "Public Health Scotland logo"),
                                
                                href= "https://www.publichealthscotland.scot/",
                                
                                target = "_blank"),
                         
                         style = "position: relative; top: -15px;"),
             windowTitle = "PHS Weekly COVID-19 report",    #title for browser tab
             header = tags$head(includeCSS("www/styles.css"),  # CSS styles
                                tags$link(rel = "shortcut icon", href = "favicon_phs.ico"), #Icon for browser tab    
                                includeHTML("www/google-analytics.html"),
                                HTML("<html lang='en'>")), #Including Google analytics     
           
           tabPanel("Data Explorer",
                
                    ### input selections
                    uiOutput("main_input_form"),
                    hr(),
        mainPanel(
           dataTableOutput("output_table")
        )
    )

) #navbarpage
) #taglist 
 