require(shinydashboard)
require(ggplot2)
require(dplyr)
require(highcharter) #to plot beautiful time series plots

server <- function(input, output) { 
  
    
  output$hcontainer <- renderHighchart ({
        
          #if(input$country==inf$region)
           #{
                df<-inf %>% filter(region==input$country)#making is the dataframe of the country
                
                df$inflation<-as.numeric(df$inflation)
                df$year<-as.numeric(df$year)
                
               
                hchart(df, "line", hcaes(x = year, y = inflation),color="red")  %>% 
                  hc_add_series(name="USA",data = US,type="line") %>%
                  hc_add_theme(hc_theme_ffx()) 
                  #to add 3-d effects
                  #hc_chart(type = "column",
                           #options3d = list(enabled = TRUE, beta = 15, alpha = 15))
                
            
          

      
            })
  
  
    
  }
