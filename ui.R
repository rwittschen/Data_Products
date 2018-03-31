#
# This is the user-interface definition of the simple mortgage
# calculator Shiny web application. The UI contains a slider input
# for the mortgage principle, a slider input for the interest rate
# and radio buttons for the length of the loan in years. The SUBMIT
# button executes the calculator using these input values.
#
library(shiny)

shinyUI(fluidPage(
  titlePanel("Simple Mortgage Calculator"),
  helpText("Select the priniciple amount, the loan interest rate and the length of the loan and hit the SUBMIT button
           to compute the monthly payment, total loan cost and total interest."),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderPrinciple",
                  "What is the mortgage principle amount ($)?", 
                  100000,
                  1000000,
                  step = 25000,
                  value=200000),
      sliderInput("sliderInterest", 
                  "What is the interest rate (%)?", 
                  1,
                  8,
                  step = 0.25,
                  value = 3),
      radioButtons("radioLength", "What is the length of the loan?",
                         choices = list("10 Years" = 10,
                                        "15 Years" = 25,
                                        "20 Years" = 20,
                                        "30 Years" = 30),
                         selected = 30),
      submitButton("Submit")
    ),
    mainPanel(
#      plotOutput("plot1"),
      h3("Monthly Payment Amount:"),
      textOutput("payment"),
      h3("Total Loan Cost:"),
      textOutput("cost"),
      h3("Total Interest:"),
      textOutput("interest")
      )
  )
))
