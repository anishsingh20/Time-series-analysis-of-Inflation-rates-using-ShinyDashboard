library(shinydashboard)
require(shiny)
#layout of the dashboard

country<-c("India","USA","China","Germany","UK","European Union","France","UAE")

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
    box(selectInput("country",label="Select Country",choices=country)) ,
    
    #box for plotting the time series plot
    box(plotOutput("country",width = 400))
    
    )#end row
    
    
  )
)
