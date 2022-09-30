library(leaflet)
library(varhandle)
library(geosphere)
library(dplyr)
library(jsonlite)
#install.packages("leaflet")

m = leaflet()
m = setView(m,lng = 120.5764329, lat =22.403331  , zoom = 15)
m = addTiles(m) # Add default OpenStreetMap map tiles
m

json_data <- fromJSON("https://raw.githubusercontent.com/SiongSng/Rapid-Antigen-Test-Taiwan-Map/data/data/antigen.json", flatten = TRUE)
#json_data$`592202`$
m = leaflet()
print(length(json_data))
m = setView(m,lng = 121.4727923, lat =25.017462, zoom = 15)
m = addTiles(m) # Add default OpenStreetMap map tiles
m <- addMarkers(m, lng=121.4727923, lat=25.017462)
# m <- addMarkers(m, lng=120.5764329, lat=22.403331, clusterOptions = markerClusterOptions())
# m <- addMarkers(m, lng=121.5764329, lat=23.403331, clusterOptions = markerClusterOptions())
m
for (x in json_data) {
  m <- addMarkers(m, lng=x$longitude, lat=x$latitude,
                  clusterOptions = markerClusterOptions())
  print(x$code)
}
m

library(leaflet)
m = leaflet()
m = addTiles(m) # Add default OpenStreetMap map tiles
m = addMarkers(m, lng=121.51, lat=25.05, icon = leafIcons )
m

install.packages("devtools")
library(devtools)
install.packages("https://cran.r-project.org/src/contrib/Archive/rlang/rlang_1.0.1.tar.gz", repos = NULL, type="source")
install.packages("htmlwidgets")
install.packages("githubinstall")
install_github("rstudio/leaflet")

install_github("hadley/dplyr")


# leaflet(data = json_data) %>%
leaflet(data = json_data) %>%
  # setView(lng = transed_lng, lat = transed_lat, zoom = 15) %>%
  # addMarkers(lng = transed_lng,lat = transed_lat, icon = UserIcon) %>%
  # addCircles(lng = transed_lng,lat = transed_lat,weight = 1, radius = 500, color = "orange") %>%
  # addTiles() %>%
  addMarkers(~longitude, ~latitude)
  # addMarkers(~longitude, ~latitude, icon = virusIcon, popup = paste(sep = "<br/>",
  #                                                                   p$id,
  #                                                                   p$date,
  #                                                                   p$species))

