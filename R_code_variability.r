library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)

setwd("C:/lab/")

# Esercizio: importa l'immagine Similaun
sen <- brick("sentinel.png")
sen

# Esercizio: plot l'immagine con la funzione ggRGB
ggRGB(sen, 1, 2, 3, stretch="lin")
ggRGB(sen, 1, 2, 3) # altro modo di scrivere la funzione ggRGB
ggRGB(sen, 2, 1, 3) # per cambiare colore alle bande NIR sulla componente g

g1 <- ggRGB(sen, 1, 2, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g1+g2 # patchwork

# Calcolare la variabilità sul NIR
nir <- sen[[1]]
nir
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow')) (100)
plot(sd3, col=clsd)

# plot con ggplot
ggplot() + # apre un plot vuoto
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer))

# viridis
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("Standard deviation by viridis package")

# cividis
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "cividis") +
ggtitle("Standard deviation by viridis package")

# magma
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation by viridis package")

# Esercizio: fare lo stesso calcolo con una finestra 7x7
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
