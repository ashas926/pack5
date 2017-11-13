#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#server function for shiny
server <- function(input, output) {


  output$return <- renderTable({
    geocode_api(input$var)},align = NULL, striped = TRUE, hover = TRUE, bordered = TRUE,
    colnames = FALSE, rownames = FALSE)

}
