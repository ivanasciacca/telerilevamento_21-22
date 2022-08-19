# R code for visualising and analysing LiDAR data

# Caricare le librerie 
library(raster)
library(rgdal)
library(viridis)
library(ggplot2)

# Settare la cartella di lavoro
setwd("C:/lab/")

#
dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013

#
dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")
dtm_2013

#
plot(dtm_2013)

#
chm_2013 <- dsm_2013 - dtm_2013
chm_2013

#
ggplot() + 
  geom_raster(chm_2013, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("CHM 2013 San Genesio/Jenesien")

