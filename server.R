library(shiny)


shinyServer(
    function(input, output) {
        #x <- reactive({input$lower_boundery})
        #y <- reactive({eval(parse(text=input$function_string))})
        #gsub("x", input$function_string, "(x())")
        
        x <- reactive({seq(from=input$lower_boundery, 
                                  to=input$upper_boundery,
                                  length.out=input$chunks+1)})
        y <- reactive(({eval(parse(text=(sub(pattern="x", x=input$function_string, replacement="(x())"))))}))

        integral <- reactive(sum((x()[2:length(x())] - x()[1:(length(x())-1)])*((y()[2:length(y())] + y()[1:(length(y())-1)])/2)))
        

#         y_vector <- reactive({y()})
#         square <- reactive({0})
#         new_function_expression <- reactive({gsub("x", input$function_string, "new_x")})
#         while(x()<input$upper_boundery){
#             new_x <- reactive({x()+(input$upper_boundery-input$lower_boundery)/input$chunks})
#             new_y <- reactive({eval(parse(text=new_function_expression))})
#             subsquare <- reactive({(new_x() - x())*y() + (new_x() - x())*(new_y() - y())*0.5})
#             square <- square() + subsquare()
#             x<-new_x()
#             y<-new_y()
#                         
#             x_vector <- reactive({c(x_vector, x)})
#             y_vector <- reactive({c(y_vector, y)})
#         }
        output$graphic <- renderPlot({plot(x(), y())})
        output$integral <- renderText(as.character(integral()))
        
        
    }
)