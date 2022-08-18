# Richiamare le librerie
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)

# Installare viridis
install.packages("viridis")
library(viridis)

# Settare la cartella di lavoro
setwd("C:/lab/")

# Esercizio: importa l'immagine Similaun 
sen <- brick("sentinel.png")
sen

# Banda1 = NIR
# Banda2 = red
# Banda3 = green

# Esercizio: plot l'immagine con la funzione ggRGB
ggRGB(sen, 1, 2, 3, stretch="lin")
ggRGB(sen, 1, 2, 3) # altro modo di scrivere la funzione ggRGB
ggRGB(sen, 2, 1, 3) # per cambiare colore alla banda NIR sulla componente g

# viola = roccia
# verde chiaro = prateria
# verde scuro = bosco
# nero = acqua 

# Mettere i grafici uno accanto all'altro tramite patchwork
g1 <- ggRGB(sen, 1, 2, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g1+g2 # patchwork

# Esercizio: plot i grafici uno sopra l'altro sempre con patchwork
g1/g2

# Esercizio: plot i due grafici (2x2)
(g1+g2)/(g1+g2)

# Calcolare la variabilità sul NIR
nir <- sen[[1]]
nir 

# La funzione focal serve per calcolare i valori focali della finestra mobile
# La matrice è formata da 3x3 pixel, unità di misura è il pixel (1/9), n colonne e n righe
# La funzione è la deviazione standard (intervallo nel quale ricade il 68% dei valori)

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
clsd <- colorRampPalette(c('blue', 'green', 'pink', 'magenta', 'orange', 'brown', 'red', 'yellow')) (100)
plot(sd3, col=clsd)
 
# Bassa variabilità è in blu come le rocce, la neve e l'acqua, molto omogenei e compatti
# Alta variabilità nei bordi dei boschi, la parte dei crepacci (in rosso)

# Plot con ggplot
ggplot() + # apre un plot vuoto
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) # geom_raster funzione con quadrati, mapping è l'argomento

# Plot con viridis, (in giallo le zone ad alta variabilità)
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("Standard deviation by viridis package")

# Utilizzare la leggenda cividis 
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "cividis") +
ggtitle("Standard deviation by viridis package")

# Utilizzare laa leggenda magma
ggplot() + 
geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option = "magma") +
ggtitle("Standard deviation by viridis package")

# Esercizio: fare lo stesso calcolo con una finestra 7x7 (matrice, unità pixel 1/49)
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
