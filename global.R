library(geosphere)
library(dplyr)
library(jsonlite)
library(varhandle)


json_data <- fromJSON("https://raw.githubusercontent.com/SiongSng/Rapid-Antigen-Test-Taiwan-Map/data/data/antigen.json", flatten = TRUE)

#
catchData <- function(now_id) {
  #df <- data.frame(matrix(ncol = 2, nrow = 0))
  for (json_item in json_data) {
    #print(class(now_id))
    if (json_item$code == now_id) {
       # item_names <- names(json_item)
       # Names <- list(item_names)
      return(json_item)
      break
    }
  }
  # return(df)
}
# Name <- c("Jon", "Bill", "Maria", "Ben", "Tina")
# Age <- c(23, 41, 32, 58, 26)
# df <- data.frame(Name, Age)
