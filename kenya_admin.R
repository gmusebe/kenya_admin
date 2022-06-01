library(sf) 
library(ggplot2) 
library(tmap)
library(tmaptools)
library(leaflet) 
library(leaflet.providers) 
library(dplyr)
library(raster) 
library(leaflet.opacity)
library(rgdal) 
library(raster) 
library(rgeos)

setwd("~/code/R/Kenya/Kenya Counties")
ke <- st_read("/home/imusebe/code/R/Kenya/Kenya Counties/ken_admbnda_adm0_iebc_20191031.shp",stringsAsFactors = FALSE) # kenya boundaries
county <- st_read("/home/imusebe/code/R/Kenya/Kenya Counties/ken_admbnda_adm1_iebc_20191031.shp", stringsAsFactors = FALSE) # county
const <- st_read("/home/imusebe/code/R/Kenya/Kenya Counties/ken_admbnda_adm2_iebc_20191031.shp",stringsAsFactors = FALSE) # constituencies
ward <- st_read("ken_admbnda_adm3_iebc_20191031.shp",stringsAsFactors = FALSE) # wards


setwd("~/code/R/Kenya/Kenya Provinces")
prov <- st_read("KEN_adm1.shp",stringsAsFactors = FALSE) # provinces
dist <- st_read("KEN_adm2.shp",stringsAsFactors = FALSE) # districts
div <- st_read("KEN_adm3.shp",stringsAsFactors = FALSE) # division
loc <- st_read("KEN_adm4.shp",stringsAsFactors = FALSE) # location
loc <- st_read("KEN_adm5.shp",stringsAsFactors = FALSE) # sub location

write.csv(level_2, "const.csv")

nai <- county[which(county$ADM1_EN == "Nairobi"), ]
nai_const <- const[which(const$ADM1_EN == "Nairobi"),]

in_red <- c("Embakasi East", "Embakasi Central", "Kasarani", "Kibra", "Dagoretti", "Makadara", "Starehe", "Mathare", "Ruaraka","Kamukunji",  "Embakasi North", "Embakasi West")

in_red <- nai_const[which(nai_const$ADM2_EN %in% in_red), ]


leaflet() %>% addTiles()  %>%
  addProviderTiles(providers$OpenStreetMap) %>%
  addPolygons(data = nai,
              color = "black",
              fillOpacity = 0.5,
              fillColor = 'red',
              weight = 2,
              opacity = 1)  %>%
  addPolygons(data = in_red,
              color = "black",
              fillOpacity = 0.5,
              fillColor = 'red',
              weight = 2,
              opacity = 1)


# Mombasa
mom <- county[which(county$ADM1_EN == "Mombasa"), ]
mom_const <- const[which(const$ADM1_EN == "Mombasa"),]


leaflet() %>% addTiles()  %>%
  addProviderTiles(providers$OpenStreetMap) %>%
  addPolygons(data = mom_const,
              color = "black",
              fillOpacity = 0.2,
              fillColor = 'red',
              weight = 2,
              opacity = 1)  %>%
  addPolygons(data = mom,
              color = "black",
              fillOpacity = 0.2,
              fillColor = 'red',
              weight = 2,
              opacity = 1)