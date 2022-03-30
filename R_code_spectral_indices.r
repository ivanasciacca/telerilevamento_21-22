library(raster)

# installa rgdal
install.packages("rgdal")
library(rgdal)

setwd("C:/lab/")

# importo il primo file -> defor1_.jpg -> dando il nome di l1992
l1992 <- brick("defor1_.jpg")
l1992
