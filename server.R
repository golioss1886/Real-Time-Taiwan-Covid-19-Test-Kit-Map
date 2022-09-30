shinyServer(function(input, output) {
    observe({
     click<-input$mymap_marker_click #!
     if(is.null(click)) {
       print("null")
       return()
     }
     print(click)
     text<-paste( "Id", click$id, "Longtitude ", click$lng,"Lattitude ", click$lat)
     leafletProxy(mapId = "mymap") %>%
       clearPopups() %>%
       addPopups(dat = click, lat = ~lat, lng = ~lng, popup = text)
     
     output$storeContent <- renderUI({
       mc <- catchData(click$id)
       print(length(mc))
       tags$div(
         tags$p(paste("Code: ",mc$code)), 
         tags$p(paste("Name: ",mc$name)), 
         tags$p(paste("Address: ",mc$address)), 
         tags$p(paste("Longitude: ",mc$longitude)), 
         tags$p(paste("Latitude: ",mc$latitude)), 
         tags$p(paste("Brands: ",mc$brands)), 
         tags$p(paste("Count: ",mc$count)), 
         tags$p(paste("Phone: ",mc$phone)), 
         tags$p(paste("Updated_at: ",mc$updated_at)), 
         tags$p(paste("Note: ",mc$note))
         #tags$p(paste("open_week: ",mc$open_week))
       )
       # p(paste("Code: ",mc$code))#,"\nName: ",mc$name))
       # HTML('<br> ')
       # p(paste("Name: ",mc$name))
       #   p("Safe", style = "color:green;font-size:50px")
       #   # print("Safe")
     }) 
     #output$storeTable <- renderTable(df)
   })
  output$out <- renderUI ({
    vec <- getLocCheck()
    if( (vec[1] == FALSE) | (vec[2] == FALSE)) {
      p("Please input longitude & latitude", style = "color:red;font-size:25px")
    }
  })
  
  getLocCheck <- reactive({
    check.numeric(c(input$Longitude,input$Latitude))
  })
  
  getLoc <- reactive({
    vec <- getLocCheck()
    if(vec[1] == TRUE & vec[2] == TRUE) {
      list(as.numeric(input$Longitude), as.numeric(input$Latitude))
    }
  })
  
  # input$Longitude,input$Latitude
  output$mymap <- renderLeaflet({
      m = leaflet()
      m = addTiles(m)
      #m = setView(m,lng = 121.4727923, lat =25.017462, zoom = 15)
       for (x in json_data) {
              # m <- addMarkers(m, lng=x$longitude, lat=x$latitude,
              #                 clusterOptions = markerClusterOptions())  
              m <- addCircleMarkers(m, lng=x$longitude, lat=x$latitude,layerId = x$code)
                            #  clusterOptions = markerClusterOptions())
              print(x$code)
       }
      m
  })
  observeEvent(input$acButton, {
     vec_loc <- getLoc()
     #leafletProxy("mymap", data = getLoc()) %>%
     leafletProxy("mymap") %>%
     setView(lng = vec_loc[1], lat = vec_loc[2], zoom = 15) %>%
     #addCircles(lng = vec_loc[1],lat = vec_loc[2],weight = 1, radius = 500, color = "orange") 
     addMarkers(lng = as.numeric(vec_loc[1]),lat = as.numeric(vec_loc[2]),
                popup = paste(sep = "<br/>",vec_loc[1],vec_loc[2])) %>%
     addCircles(lng = as.numeric(vec_loc[1]),lat = as.numeric(vec_loc[2]),weight = 1, radius = 500, color = "orange") 
  })
  
   # observe({
   #   vec_loc <- getLoc()
   #   #leafletProxy("mymap", data = getLoc()) %>%
   #   leafletProxy("mymap") %>%
   #   setView(lng = vec_loc[1], lat = vec_loc[2], zoom = 15) 
   # })
   
   # observeEvent(input$mymap_marker_click, { 
   #   p <- input$mymap_marker_click  # typo was on this line
   #   print(p)
   # })
   
 

  
})
  # text2<-paste("You've selected point ", click$id)
     # print(text)
     # print(text2)
     # mymap$clearPopups()
     # mymap$showPopup( click$lat, click$lng, text)
     # output$Click_text<-renderText({
     #   text2
     # })