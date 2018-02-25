

#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

gpa_data <- read.table("data/gpaData.txt", header = TRUE, as.is = TRUE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  to_plot <- reactive({
    df <- gpa_data[gpa_data$name2 == input$School, ]
    return(df)
  })
  
  output$plot <- renderPlot({
    
    ggplot(data = to_plot(),
           aes(x = year, y = gpa)) +
      geom_point(colour = "blue") +
      geom_line(colour = "blue") +
      labs(x = "Year", y = "GPA")
    
    
  })
  
})

      

    
        

     

  
    