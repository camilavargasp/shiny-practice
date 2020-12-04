##Camila Vargas
## Prcticing on how to creat a Shiny App


library(shiny)

##Basic app

# ui <- fluidPage(
#   
#   selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
#   verbatimTextOutput("summary"),
#   tableOutput("table")
# )
# 
# server <- function(input, output, session){
#   dataset <- reactive({
#     get(input$dataset, "package:datasets")
#   })
#   
#   output$summary <- renderPrint({ 
#     summary(dataset())
#   })  
#   
#   output$table <- renderTable({
#     dataset()
#     
#   })
#   
# }
# 
# shinyApp(ui, server)


############################
#Excersise 2.8.1

# ui <- fluidPage(
#   
#   textInput("name", "What's your name?"),
#   
#   textOutput("greeting")
# )
# 
# server <- function(input, output, session){
#   
#   output$greeting <- renderText({
#     paste0("Hello ", input$name)
#   })
#   
# }
# 
# shinyApp(ui, server)


###################################
#Excersise 2.8.3

# ui <- fluidPage(
#   sliderInput("x", label = "If x is", min = 1, max = 50, value = "x"),
#   sliderInput("y", label = "and y is", min = 1, max = 50, value = "y"),
#   "then x times y is",
#   textOutput("product")
# )
# 
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     input$x * input$y
#   })
# }
# 
# shinyApp(ui, server)

##########################
#Excersise 2.8.4

# ui <- fluidPage(
#   sliderInput("x", "If x is", min = 1, max = 50, value = 30),
#   sliderInput("y", "and y is", min = 1, max = 50, value = 5),
#   "then, (x * y) is", textOutput("product"),
#   "and, (x * y) + 5 is", textOutput("product_plus5"),
#   "and (x * y) + 10 is", textOutput("product_plus10")
# )
# 
# server <- function(input, output, session) {
#   output$product <- renderText({ 
#     
#     product <- reactive({ 
#      input$x * input$y
#       
#     })
#   
#      product()
#   
#   })
#   
#   output$product_plus5 <- renderText({ 
#     
#     product() + 5
#   })
#   
#   output$product_plus10 <- renderText({ 
#    
#     product() + 10
#   })
# }
# 
# shinyApp(ui, server)
# 

##############################
##2.8.5

library(ggplot2)

datasets <- data(package = "ggplot2")$results[c(2, 4, 10), "Item"]

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  
  output$summmary <- renderPrint({
    summary(dataset())
  })
  
  output$plot <- renderPlot({
    plot(dataset()[[3]], dataset()[[4]])
  }, res = 96)
}


shinyApp(ui, server)