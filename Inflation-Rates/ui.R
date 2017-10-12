library(shinydashboard)
require(shiny)
require(highcharter)
#layout of the dashboard

country<-c("India","United States","China, People's Republic of","Russian Federation","Germany","United Kingdom","European Union","France","United Arab Emirates")

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
            
            
            column(12,
              
              box(selectInput("country",label="Select Country",choices=country),width = 12) 
                  
              ),#end column
            
              #box for plotting the time series plot
            column(12,
                   
              box(
                
                highchartOutput("hcontainer"),
               
              
              
              width="12") #end box2
          
                  ) #end column
                ),#end row
                h4("Made with love from", strong("Anish Singh Walia")),
                a("R code for this project",target="_blank",href="https://github.com/anishsingh20/Analzying-Inflation-Rates-Worldwide")
              ),
    
    
    
    #second tab menu- ABOUT
          tabItem(tabName="about",
                  
                 h2("What is Inflation ?",style="text-align:center")
                  
                  
                  )
    )#end tabitems
  
    
)#end body

)#end dashboard