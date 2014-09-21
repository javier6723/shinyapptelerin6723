library(shiny)

shinyUI(
    pageWithSidebar(
    #application title
        headerPanel("Prediction of Life Expectancy"),
        sidebarPanel(
                     p('This shiny app predict the life expectancy in years in the USA using as regressors in a multiple regression model the population estimate as of July 1 1975, murder and non-negligent manslaughter rate per 100,000 population (1976), percent high-school graduates (1970). The data came from  the state.x77  part of "state" R datasets.'),                
                     p('Please insert the values to predit the Life expentacy'),
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
