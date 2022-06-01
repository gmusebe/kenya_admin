library(tidyverse)
library(RgoogleMaps)
library(leaflet)
library(lubridate)
library(ggmap)
library(sf)

library(RColorBrewer)
library(stringr)

library(reshape2)
library(scales)
library(magrittr)
library(tibble)
library(naniar)
library(ggpubr)
library(plotrix)
library(ggmap)
library(stringi)
library(dplyr)
library(date)
library(getPass)
library(RMariaDB)
library(tidyr)
library(RMySQL)

cva <- read.csv(
  "/home/musebe/Downloads/My Files Ivan/my other files/code/R/Kenya/Sign_Inc.csv",
  header = TRUE,
  na.strings = "")

province <- st_read(
  "/home/imusebe/code/R/Kenya/Kenya Counties/ken_admbnda_adm0_iebc_20191031.shp", # nolint
  stringsAsFactors = FALSE)


getColor <- function(cva) { # nolint
    sapply(cva$cat, function(cat) {
      if(cat == 1) { #crime
        "darkgreen"
      } else if(cat == 2) { #terrorism
        "purple"
      } else if(cat == 3) { #communal ODM
        "darkblue"
      } else if(cat == 4) { # security_operation  
        "darkred"
      } else if(cat == 5) { # PAA
        "blue"
      } else if(cat == 6) { # Jubilee
        "#ecf00f"
      } else if(cat == 7) {# UDA
        "orange"
      } else if(cat == 8) {# U
        "orange"
      } else {
        "cadetblue"
      } })
  }

icons <- awesomeIcons(
  icon = 'ios-close', # nolint
  lib = 'ion',
  iconColor = "#FFFFFF",
  markerColor = getColor(cva),
  fontFamily = "calibri",
  text = cva$no_1,
  squareMarker = FALSE
)

leaflet(cva) %>%
    addTiles() %>%
    addAwesomeMarkers(~long, ~lat, icon = icons, popup = cva$location
    )


leaflet(data) %>% addTiles() %>% addMarkers(
  clusterOptions = markerClusterOptions())

  