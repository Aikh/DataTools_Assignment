library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Quadratic Solver"),
  
    sidebarPanel(
      numericInput('a', 'x^2 term', 5),
      numericInput('b', 'x term', 90),
      numericInput('c', 'constant', 5),
      submitButton('Submit')
    ),
    mainPanel(
        h3('Results'),
        h4('You entered'),
        verbatimTextOutput("inputValue"),
        h4('The x-axis intercepts are '),
        verbatimTextOutput("f_root"),
        verbatimTextOutput("s_root"),
        h4('View of the curve around the intercepts (where available): '),
        plotOutput('curveplot')
    )
  )
)

