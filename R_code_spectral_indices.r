library(raster)

# installa rgdal
install.packages("rgdal")
library(rgdal)

setwd("C:/lab/")

# importo il primo file -> defor1_.jpg -> dando il nome di l1992
l1992 <- brick("defor1_.jpg")
l1992

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
# layer 1 = Nir
# layer 2 = red
# layer 3 = green

# Esercizio: importa il secondo file -> defor2_.jpg -> dando il nome l2006
l2006 <- brick("defor2_.jpg")
l2006

plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Esercizio: plot in un multiframe le due immagini in due righe e una colonna 
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Calcolare il DVI Difference Vegetation Index (1992)
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992

cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black')) (100)
plot(dvi1992, col=cl)

# Calcolare il DVI Difference Vegetation Index (2006)
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006

cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black')) (100)
plot(dvi2006, col=cl)
