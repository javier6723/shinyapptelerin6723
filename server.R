library(shiny)
data(state)
statex77<-as.data.frame(state.x77)
colnames(statex77)[4] = "Life.Exp"    
colnames(statex77)[6] = "HS.Grad"
statex77$Density = statex77$Population * 1000 / statex77$Area

modelfit<-lm(formula = Life.Exp ~ Population + Murder + HS.Grad + Frost,data = statex77)

prediction<-function(inPopulation,inMurder,inHS.Grad,inFrost){
            predict(modelfit, 
                    list(Population=inPopulation,Murder=inMurder, HS.Grad=inHS.Grad, Frost=inFrost)
            )
}
shinyServer(
    function(input,output){
        output$summary<-renderPrint({summary(modelfit)})
        output$prediction<-renderPrint({prediction(input$inPopulation,input$inMurder,input$inHS.Grad,input$inFrost)})
    }
)