#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

gpa_data <- read.table("data/gpaData.txt", header = TRUE, as.is = TRUE)

shinyUI(pageWithSidebar(
  
  headerPanel("Grade inflation at universities and colleges"),
  
  sidebarPanel(
    
    selectInput("School", label = h4("School"), 
                choices = gpa_data %>% .$name2 %>% unique())
  ),
  
  mainPanel(
    plotOutput('plot'), 
    p("These data are from the ", a("Grade Inflation", href = "http://www.gradeinflation.com"), "website.  They are presented here
        for educational, not-for-profit use only.  Please visit ", a("www.gradeinflation.com", 
                                                                     href = "http://www.gradeinflation.com"), "for a detailed discussion of grade inflation 
        in universities and colleges across the U.S.  The ", a("Grade Inflation ", href = "http://www.gradeinflation.com"),
      "website also contains detailed information on how these data were collected."),
    p("These data were collected automatically with R; every effort was made to clean the 
        data where necessary.  However, mistakes may remain.  If you find errors in the data, 
        please feel free to report them to: steven[dot]ranney[at]gmail[dot]com.  They will be updated
        as time allows."),
    p("I considered adding a linear regression line to each of these plots but thought better of it.  With some sort of 
        statistical representation comes potentially bad inferences.  The data are simply presented as GPA as a function of 
        Time.  Make of it what you will.  Between these graphical representations and the information available at ", 
      a("gradeinflation.com", href = "http://www.gradeinflation.com"), ", you should be able to come to your own conclusions.")
  )
))