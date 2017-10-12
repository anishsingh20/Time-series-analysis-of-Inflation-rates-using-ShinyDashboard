require(shinydashboard)
require(ggplot2)
require(dplyr)

server <- function(input, output) { 
  
      output$tsplot<- renderPlot ({
        
          
            
            df<-inf%>% filter(region==input$country)#making is the dataframe of the country
            
            df$inflation<-as.numeric(df$inflation)
            df$year<-as.numeric(df$year)
            
            theme_set(theme_bw())
            #plotting the time series plot
            ggplot(aes(x=year,y=inflation),data=df) +
              geom_point(size=2,color="orange") + 
              geom_line(color="orange") +
              scale_x_continuous(limits=c(1980,2017),breaks=seq(1980,2017,5)) 
              #labs(x="Year",y="Inflation Rates",title="Time series of Inflation Rates for"+ input$country)
            
            
            
          

      
            })
  
  
    
  }
