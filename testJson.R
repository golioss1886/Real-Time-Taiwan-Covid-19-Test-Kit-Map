#install.packages("jsonlite")
library(jsonlite)
json_data <- fromJSON("https://raw.githubusercontent.com/SiongSng/Rapid-Antigen-Test-Taiwan-Map/data/data/antigen.json", flatten = TRUE)
json_data$`5931092175`$latitude
for (data_item in json_data) {
  print(data_item$open_week)
}
