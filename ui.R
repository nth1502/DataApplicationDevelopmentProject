library(shiny)
library(rCharts)
require(markdown)

shinyUI(
    pageWithSidebar(
        titlePanel("Autralian life table 2011-2013"
        ),
        
        sidebarPanel(
            selectInput('State',
                        'State :',
                        c('New South Wales'= '2', 
                        'Victoria' = '3',
                        'Queenland' ='4',
                        'South Australia' = '5',
                        'Western Australia' = '6',
                        'Tasmania' = '7',
                        'Northern Territory' = '8',
                        'Australian Capital Territory' = '9',
                        'National' = '10')
            ),
            
            numericInput('Age', 
                         'Age', 
                         25, min=0, max=100
            ),
            
            radioButtons('Gender',
                        'Gender :',
                        c('Male' = 'Male',
                        'Female' = 'Female')
            ),
            
            checkboxGroupInput('Info',
                               'Interested information :',
                               c('lx' = 'lx',
                                 'qx' = 'qx',
                                 'Lx' = 'Lx',
                                 'ex' = 'ex'),
                               selected = c('lx', 'qx', 'Lx', 'ex')
            )
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel('About',
                         includeMarkdown("include.md")
                ),
                
                tabPanel(p(icon('line-chart'),'Result'), 
                         h4('Interested information'),
                         tableOutput('intdata'),
                         h4('Analysis of qx / mortality rate'),
                         chartOutput('chart1','polycharts'),
                         chartOutput('chart2','polycharts'),
                         chartOutput('chart3','polycharts')
                ),
                
                tabPanel(p(icon('table'), 'Life table'),
                         tableOutput('table')
                )
            )
        )
    )
)