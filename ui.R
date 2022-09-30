#install.packages("shiny")
library(shiny)
library(plotly)
library(leaflet)
library(varhandle)

shinyUI(fluidPage( 
  # title
  #titlePanel("Covid-19 map"), # page title
  titlePanel(
    h1("Covid-19 Rapid test map", align = "center")
  ),
  # Sidebar for location input
  sidebarLayout(
    sidebarPanel(
      textInput("Longitude","Longitude",121.2652727),
      #textInput("Longitude","Longitude"),
      br(),
      textInput("Latitude","Latitude",24.9701632),
      #textInput("Latitude","Latitude"),
      br(),
      actionButton("acButton", "Submit"),
      htmlOutput('storeContent'),
      #submitButton("Submit"),
#      htmlOutput("result_text"),
#      uiOutput("result_picture"),
      htmlOutput("out")
    ),
    mainPanel(
      leafletOutput("mymap",height = 1000)#1000
    )
  ))
)