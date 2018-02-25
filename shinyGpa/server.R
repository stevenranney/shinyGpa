#  source("lm_eqn.R")
  gpaData <- read.table('../data/gpaData.txt', header=T, as.is = T)
 
  library(dplyr)
  library(ggplot2)

  shinyServer(function(input, output) {

    dataset <- reactive(function(){
      gpaData[gpaData$name2 == input$School, ]
    })
    
   
    output$plot <- renderPlot({
      
      dataset() %>%
        ggplot(aes(x = year, y = gpa, colour = "blue")) +
        geom_point() +
        labs(title = dataset()$name2[1], x = "Year", y = "GPA")
        
      # plot(x = dataset()$year, y = dataset()$gpa, type = "b", pch = 19, col = "blue", 
      #      main = dataset()$name2[1], xlab = "YEAR", ylab = "GPA")

      }) #Close renderPlot statement
    
    }) #Close shiny statement


      

    
        

     

  
    