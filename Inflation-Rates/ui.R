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
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("About", tabName = "about", icon = icon("th"))
    )
  ),
  
  
  #defines bodys
  dashboardBody(
  
  tabItems(
    
  #First TAB Menu-Dashboard  
        tabItem(tabName = "dashboard",
          
          fluidRow(
            
              box(selectInput("country",label="Select Country",choices=country)) ,
          
              #box for plotting the time series plot
              box(plotOutput("country",width = 400))
          
                  )#end row
              ),
    
    
    
    #second tab menu- ABOUT
          tabItem(tabName="about",
                  
                 h2("What is Inflation ?",style="text-align:center")
                  
                  
                  )
    )#end tabitems
  
    
)#end body
)
