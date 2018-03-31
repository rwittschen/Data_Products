#
# This is the server logic the simple mortgage calculator.
# Inputs from the UI are used to compute the monthly mortgage
# payment, the total mortgage cost over the life of the loan
# and the total interest.
#
library(shiny)
shinyServer(function(input, output) {
  
  mort_pay <- reactive({
    P <- input$sliderPrinciple
    I <- input$sliderInterest
    L <- as.integer(input$radioLength)
    # compute the monthly interest rate
    J <- I/(12 * 100)
    # compute the number of months in the loan
    N <- 12 * L
    # compute the monthly mortgage payment
    M <- P*J/(1-(1+J)^(-N))
    # output the monthly mortgage payment formatted appropriately
    paste0("$", formatC(as.numeric(M), format="f", digits=2, big.mark=","))
  })
  
  mort_cost <- reactive({
    P <- input$sliderPrinciple
    I <- input$sliderInterest
    L <- as.integer(input$radioLength)
    # compute the monthly interest rate
    J <- I/(12 * 100)
    # compute the number of months in the loan
    N <- 12 * L
    # compute the monthly mortgage payment
    M <- P*J/(1-(1+J)^(-N))
    # compute the total cost of the loan over the life of the loan
    O <- M*N
    # output the cost formatted appropriately
    paste0("$", formatC(as.numeric(O), format="f", digits=2, big.mark=","))
  })
  
  mort_interest <- reactive({
    P <- input$sliderPrinciple
    I <- input$sliderInterest
    L <- as.integer(input$radioLength)
    # compute the monthly interest rate
    J <- I/(12 * 100)
    # compute the number of months in the loan
    N <- 12 * L
    # compute the monthly mortgage payment
    M <- P*J/(1-(1+J)^(-N))
    # compute the total cost of the loan over the life of the loan
    O <- M*N
    # compute the total interest amount of the loan
    int <- O-P
    # output the total interest formatted appropriately
    paste0("$", formatC(as.numeric(int), format="f", digits=2, big.mark=","))
  })
  # send the output values back to the User Interface
  output$payment <- renderText({
    mort_pay()
    })
  output$cost <- renderText({
    mort_cost()
  })
  output$interest <- renderText({
    mort_interest()
  })
})  