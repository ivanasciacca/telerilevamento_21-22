# R code for visualising and analysing LiDAR data

# Caricare le librerie 
library(raster)
library(rgdal)
library(viridis)
library(ggplot2)

# Settare la cartella di lavoro
setwd("C:/lab/")

# Caricare tramite la funzione raster il raster layer nominato dsm_2013
dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
dsm_2013

# Caricare tramite la funzioe raster il raster layer nominato dtm_2013
dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")
dtm_2013

# DSM (Digital Surface Model), si intende la superficie terrestre comprenstiva degli oggetti che ci stanno sopra: edifici, alberi ed altri manufatti
# DTM (Digital Terrain Model), rappresenta l’andamento della superficie del suolo senza gli elementi antropici e vegetazionli 

# Plot del raster layer dtm_2013
plot(dtm_2013)

# Calcolare chm_2013
# CHM (Canopy Height Model) rappresenta l'altezza della vegetazione
chm_2013 <- dsm_2013 - dtm_2013
chm_2013

# Importare e plottare chm_2013 con la scala di colori viridis
ggplot() + 
  geom_raster(chm_2013, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("CHM 2013 San Genesio/Jenesien")


# Importare il raster layer del 2004, dsm_2004
dsm_2004 <- raster("2004Elevation_DigitalElevationModel-2.5m.tif")
dsm_2004

# Importare il raster layer del 2004, dtm_2004
dtm_2004 <- raster("2004Elevation_DigitalTerrainModel-2.5m.tif")
dtm_2004

# Plot dtm_2004
plot(dtm_2004)

# Calcolare chm_2004
chm_2004 <- dsm_2004 - dtm_2004
chm_2004

# Importare e plottare chm_2004 con la scala di colori viridis
ggplot() + 
  geom_raster(chm_2004, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("CHM 2004 San Genesio/Jenesien")


# Calcolare la differenza tra CHM del 2013 e 2004
# Presenta un errore perchè i dati hanno risoluzione diverse, più bassa nel 2004 e più alta nel 2013
difference_chm <- chm_20013-chm_2004 

# Resampling funzione percambiare la risulzione del chm_2013, ricampionare l'immagine del 2013 sulla base di quella del 2004
chm_2013r <- resample(chm_2013, chm_2004)
difference_chm <- chm_2013r-chm_2004

ggplot() +
geom_raster(difference_chm, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("CHM difference San Genesio/Jenesien")

# Reading the point cloud
point_cloud <- readLAS("point_cloud.laz")

plot(point_cloud)
                    




