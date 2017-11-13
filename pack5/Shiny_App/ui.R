
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#UI function for shiny

ui <- fluidPage(
  h3(headerPanel("Address fetching using Geocode API"),align = "center"),
  sidebarLayout(
    sidebarPanel(

      textInput("var", label = "Dhaka")),


    mainPanel(tableOutput("return"),
              textOutput("print"))
  )
)
