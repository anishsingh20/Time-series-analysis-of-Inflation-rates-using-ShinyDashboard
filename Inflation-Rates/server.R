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
  
  
    output$hc2<-renderHighchart({
      hc <- highchart() %>% 
        hc_xAxis(categories=inf$year) %>% 
        hc_add_series(name = "India", data = India$inflation) %>% 
        hc_add_series(name = "USA", data = US$inflation) %>%
        hc_add_series(name = "UK", data = UK$inflation) %>%
        hc_add_series(name = "China", data = China$inflation) %>%
        hc_add_series(name = "Germany", data = Ger$inflation) %>%
        hc_add_series(name="Japan",data=Japan$inflation) %>%
        #to add colors
        hc_colors(c("red","blue","green","purple","darkpink","orange"))
      
      hc
      
      
      
    })
    
    output$hc3<-renderHighchart({
      
      union<-inf %>% filter(region==input$region)
      union$year<-as.numeric(union$year)
      union$inflation<-as.numeric(union$inflation)
      hchart(union,hcaes(x=year,y=inflation),type="area",color="#2B1F97") %>%
        hc_add_theme(hc_theme_ffx()) 
      
      
      
      
    })
    
    output$hc4<-renderHighchart({
      world<-inf %>% filter(region=="World")
      world$year<-as.numeric(world$year)
      world$inflation<-as.numeric(world$inflation)
      #plotting the plot
      hchart(world,hcaes(x=year,y=inflation),type="area",color="#B915A3") %>%
        hc_add_theme(hc_theme_ffx()) 
      
    })
  
  
    
  }
