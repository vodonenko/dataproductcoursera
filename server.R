library(shiny)


shinyServer(
    function(input, output) {
       
        x <- reactive({seq(from=input$lower_boundery, 
                                  to=input$upper_boundery,
                                  length.out=input$chunks+1)})
        y <- reactive(({eval(parse(text=(sub(pattern="x", x=input$function_string, replacement="(x())"))))}))

        integral <- reactive(sum((x()[2:length(x())] - x()[1:(length(x())-1)])*((y()[2:length(y())] + y()[1:(length(y())-1)])/2)))
        

        output$graphic <- renderPlot({plot(x(), y())})
        output$integral <- renderText(as.character(integral()))
        
        
    }
)
