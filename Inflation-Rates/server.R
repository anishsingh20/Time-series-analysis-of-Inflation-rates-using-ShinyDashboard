require(shinydashboard)
require(ggplot2)
require(dplyr)
require(highcharter)

server <- function(input, output) { 
  
    
  output$tsplot <- renderPlot ({
        
          #if(input$country==inf$region)
           #{
                df<-inf %>% filter(region==input$country)#making is the dataframe of the country
                
                df$inflation<-as.numeric(df$inflation)
                df$year<-as.numeric(df$year)
                
                  
                hchart(df, "line", hcaes(x = year, y = inflation))
                #theme_set(theme_bw())
                #plotting the time series plot
                #ggplot(aes(x=year,y=inflation),data=df) +
                  #geom_point(size=2,color="orange") + 
                  #geom_line(color="orange") +
                  #scale_x_continuous(limits=c(1980,2017),breaks=seq(1980,2017,5)) 
                  #labs(x="Year",y="Inflation Rates",title="Time series of Inflation Rates for"+ input$country)
                
          #}#end if 
          #else {
          #  return(h2("Country not Found"))
          #}
            
          

      
            })
  
  
    
  }
