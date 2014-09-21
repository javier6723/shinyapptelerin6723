library(shiny)

shinyUI(
    pageWithSidebar(
    #application title
        headerPanel("Prediction of LIfe Expectancy"),
        sidebarPanel(
                     numericInput('inPopulation', 'Population', 0),
                     numericInput('inMurder', 'Murder', 0),
                     numericInput('inHS.Grad', 'HS.Grad', 0),
                     numericInput('inFrost', 'Frost', 0),
                     submitButton('Submit')
                     ), 
        mainPanel(
            h3('Summary of the model'),
            verbatimTextOutput("summary"),
            h3("Prediction"),
            verbatimTextOutput("prediction")
            )
    )
)
