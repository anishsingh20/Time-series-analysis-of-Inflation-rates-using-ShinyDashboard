require(shinydashboard)
require(ggplot2)
require(dplyr)
require(highcharter) #to plot amazing time series plots

server <- function(input, output) { 
  
    
  output$hcontainer <- renderHighchart ({
        
          #if(input$country==inf$region)
           #{
                df<-inf %>% filter(region==input$country)#making is the dataframe of the country
                
                df$inflation<-as.numeric(df$inflation)
                df$year<-as.numeric(df$year)
                
               #plotting the data
                hchart(df, "line",color="#DC270C",hcaes(x=year,y=inflation))  %>%
                  
                  hc_exporting(enabled = TRUE) %>% 
                  hc_tooltip(crosshairs = TRUE, backgroundColor = "#FCFFC5",
                             shared = TRUE, borderWidth = 2) %>%
                  hc_title(text="Time series plot of Inflation Rates",align="center") %>%
                  hc_subtitle(text="Data Source: IMF",align="center") %>%
                  hc_add_theme(hc_theme_ffx()) 
                  #to add 3-d effects
                  #hc_chart(type = "column",
                           #options3d = list(enabled = TRUE, beta = 15, alpha = 15))
                
            
          

      
            })
  
  
    
  }
