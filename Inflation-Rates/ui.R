library(shinydashboard)
require(shiny)
#layout of the dashboard

dashboardPage(
  #defines header
  dashboardHeader(
    title="Inflation Rates" ,
    dropdownMenu()
  ),
  #defines sidebar
  dashboardSidebar(),
  #defines bodys
  dashboardBody(
    #making boxes in row
    fluidRow(
    box(selectInput("country",label="Select Country")) ,  
    box(plotOutput("india"),width = 400)
    )#end row
    
    
  )
)
