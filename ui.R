library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Integration Approximation"),
    sidebarPanel(
        textInput(inputId='function_string', label='Input integrated function here:', value="x^2"),
        numericInput(inputId='lower_boundery', label = 'Input lower boundary of integration here:',value=0),
        numericInput(inputId='upper_boundery', label = 'Input upper boundary of integration here:',value=1),
        sliderInput('chunks', 'Define number of chunks here:',value = 100, min = 1, max = 1000, step = 1)
    ),
    mainPanel(
        
        tabsetPanel(type = "tabs", 
                    tabPanel("Scatter", plotOutput("graphic")), 
                    tabPanel("Calculated definite integral", verbatimTextOutput("integral")), 
                    tabPanel("Documentation", h1("Area Under A Curve"), 
                             h4("Definite integral could be calculated geomterically.
                                 By breaking the area into partitions and caclulating the area 
                                of each rectangle associated with each partition we can calculate the total area under 
                                  the curve")
                             )
        )
        
        
      
        
    )
))
