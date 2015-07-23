library(shiny)
library(xlsx)
library(rCharts)

# Load helper functions
source("helpers.R", local = TRUE)

#Load data
for (i in 2:10){
    temp <- read.xlsx2('./data/data.xls',
                       sheetIndex = i,
                       colIndex = 1:9,
                       startRow = 8,
                       endRow = 108,
                       header=F)
    dataname <- paste("state",i,sep="")
    assign(dataname,temp)
}
#Free temp data
rm(temp)

#Shiny server
shinyServer(function(input,output){
    lifetable <- reactive({
        gettable(input$State, input$Gender)
    })
    
    interestData <- reactive({
        extractdata(input$State, input$Gender, input$Age, input$Info)
    })
    
    output$table <- renderTable({lifetable()}, 
                                include.rownames = F)
    
    output$intdata <- renderTable({interestData()}, 
                                  include.rownames = F)
    
    output$chart1 <- renderChart2({
        plotqx(input$State, input$Gender)
    })
})
