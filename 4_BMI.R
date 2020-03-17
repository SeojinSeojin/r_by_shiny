library(shiny)
ui <- fluidPage(
  titlePanel("BMI "),
  sidebarPanel(
    numericInput('wt', 'Weight in Kg', 60, min=10, max=120),
    numericInput('ht', 'height in cm', 160, min=80, max=240),
    submitButton('submit')
  ),
  mainPanel(
    h3('Results'),
    h4('Your Weight'),
    verbatimTextOutput("inputValue1"),
    h4('Your height'),
    verbatimTextOutput('inputValue2'),
    h4('Your BMI is'),
    verbatimTextOutput("results")
  )
)

server <- function(input, output){
  bmi_calc <- function(weight, height) (weight/(height/100)^2)
  output$inputValue1 <- renderPrint({input$wt})
  output$inputValue2 <- renderPrint({input$ht})
  output$results <- renderPrint({bmi_calc(input$wt, input$ht)})
}

shinyApp(ui=ui, server=server)