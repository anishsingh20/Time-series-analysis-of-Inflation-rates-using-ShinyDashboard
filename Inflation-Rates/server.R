require(shinydashboard)

server <- function(input, output) { 
  
      output$tsplot<- renderPlot ({
        
          if(input$country==inf$region){
            
            region<-filter(inf,region=input$country)#region is the dataframe of the country
            
            region$inflation<-as.numeric(region$inflation)
            region$year<-as.numeric(region$year)
            
          }
      
            })
  
  
    
  }
