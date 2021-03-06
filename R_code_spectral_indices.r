library(raster)

# Installare rgdal
install.packages("rgdal")
library(rgdal)
# Installare RStoolbox
install.packages("RStoolbox")
library(RStoolbox)
# Installare rasterdiv
install.packages("rasterdiv")
library(rasterdiv)

# Settaggio della cartella di lavoro
setwd("C:/lab/")

# Importare il primo file -> defor1_.jpg -> dando il nome di l1992
l1992 <- brick("defor1_.jpg")
l1992

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
# layer 1 = Nir
# layer 2 = red
# layer 3 = green

# Esercizio: importare il secondo file -> defor2_.jpg -> dando il nome l2006
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

# DVI differenze nel tempo
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue', 'white', 'red')) (100)
dev.off()
plot(dvi_dif, col=cld)


# secondo giorno
library(raster)
setwd("C:/lab/")

l1992 <- brick("defor1_.jpg")
l1992

l2006 <- brick("defor2_.jpg")
l2006

# Calcolare NDVI
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])
# altro metodo
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])
ndvi1992

# plottiamo l'immagine
cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black')) (100)
plot(ndvi1992, col=cl)

# multiframe con il plotRGB dell'immagine sopra e l'ndvi sotto
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)

# 2006
dvi2006 = l2006[[1]] - l2006[[2]]
ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])
ndvi2006

# multiframe con NDVI1992 sopra e NDVI2006 sotto 
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# automatic spectral indices by the spectralIndices function
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1 ) 
plot(si1992, col=cl)

si2006 <- spectralIndices(l2006, green=3, red=2, nir=1 ) 
plot(si2006, col=cl)


## rasterdiv
plot(copNDVI)
