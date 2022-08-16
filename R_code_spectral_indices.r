# Richiamare la libreria raster
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

# Plot RGB layers
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
# layer 1 = Nir
# layer 2 = red 
# layer 3 = green

# Esercizio: importare il secondo file -> defor2_.jpg -> dando il nome l2006
l2006 <- brick("defor2_.jpg")
l2006

# Plot RGB layers
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Esercizio: plot in un multiframe le due immagini in due righe e una colonna 
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Calcolare il DVI Difference Vegetation Index (1992). ( Utilizzo gli elementi [[]] )
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992

# Cambiare la leggenda
cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black')) (100)
plot(dvi1992, col=cl)

# Calcolare il DVI Difference Vegetation Index (2006)
dvi2006 = l2006[[1]] - l2006[[2]]
dvi2006

# Cambiare la leggenda (deforestazione in giallo)
cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black')) (100)
plot(dvi2006, col=cl)

# DVI differenze nel tempo
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue', 'white', 'red')) (100)
dev.off()
plot(dvi_dif, col=cld)
# La differenza di DVI molto alta è segnata in rosso, indica l'elevata deforestazione


# Secondo giorno
# Range DVI a 8 bit: -255 a 255
# Range NDVI a 8 bit: -1 a 1

# Range DVI a 16 bit: -65535 a 65535
# Range NDVI a 16 bit: -1 a 1

# Richiamare la libreria Raster
library(raster)
# Settaggio della cartella di lavoro
setwd("C:/lab/")

# Caricare l'intero blocco di bande dell'immagine l1992
l1992 <- brick("defor1_.jpg")
l1992

# Caricare l'intero blocco di bande dell'immagine l2006
l2006 <- brick("defor2_.jpg")
l2006

# Calcolare NDVI del 1992
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992 / (l1992[[1]] + l1992[[2]])
# Altro metodo
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])
ndvi1992

# Cambiare la leggenda 
cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black')) (100)
plot(ndvi1992, col=cl)

# Multiframe con il plotRGB dell'immagine sopra l1992 e l'ndvi sotto ndvi1992
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)

# Calcolare NDVI del 2006
dvi2006 = l2006[[1]] - l2006[[2]]
ndvi2006 = dvi2006 / (l2006[[1]] + l2006[[2]])
ndvi2006

# Multiframe con NDVI1992 sopra e NDVI2006 sotto 
par(mfrow=c(2,1))
# Valore NDVI alto
plot(ndvi1992, col=cl) 
# Valore NDVI bassi, suolo nudo, zona agricola
plot(ndvi2006, col=cl)

# automatic spectral indices by the spectralIndices function
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1 ) 
plot(si1992, col=cl)

si2006 <- spectralIndices(l2006, green=3, red=2, nir=1 ) 
plot(si2006, col=cl)


## rasterdiv
plot(copNDVI)
