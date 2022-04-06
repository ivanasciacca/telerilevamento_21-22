# Il mio codice in R per il telerilevamento

# install.packages("raster")
library(raster)

# Settaggio cartella di lavoro 
setwd("C:/lab/")

# Importare l'immagine satellitare e assegnare all'ogetto l2011 la funzione
l2011 <- brick("p224r63_2011.grd")
l2011

# Visualizzare l'immagine l2011
plot(l2011)

# Cambiare i colore delle immagini
cl <- colorRampPalette (c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

# Landsat ETM+
# b1 = blu 
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# Plot della banda del blu b1 - B1_sre
plot(l2011$B1_sre)
# Plot dell'elemento
plot(l2011[[1]])

cl <- colorRampPalette (c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre , col=cl)

# Plot b1 da dark blue a light blue
clb <- colorRampPalette (c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre , col=clb)

# Esportare l'immagine nella cartella lab come pdf (solo il plot, non i dati)
pdf("banda1.pdf")
plot(l2011$B1_sre, col=clb)
dev.off()

# Steso procedimento per esportare l'immagine (solo il plot, non i dati) con la funzione png
png("banda1.png")
plot(l2011$B1_sre, col=clb)
dev.off()

# Plot b2 da dark green a light green
clg <- colorRampPalette (c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre , col=clg)

# Multiframe con 1 riga e 2 colonne
par(mfrow=c(1,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# Esportare multiframe plot
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# Invertire il multiframe 2 righe e 1 colonna
par(mfrow=c(2,1))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# Plot b3 da dark red a pink 
clr <- colorRampPalette (c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre , col=clr)

# Plot b4 da red a orange, da orange a yellow
clnir <- colorRampPalette (c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre , col=clnir)

# creiamo il multiframe con 2 righe e 2 colonne 
par(mfrow=c(2,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
plot(l2011$B3_sre , col=clr)
plot(l2011$B4_sre , col=clnir)

# Plot dell'immagino l2011 nella banda NIR
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)
# oppure
plot(l2011[[4]])

# Plot RGB layers (a colori naturali)
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
#
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
#
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
# (in giallo parte nuda, zone agricole)
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")
#
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Esercizio: costruire un multiframe visibile con i colori RGB
# (linear stretch) (colori naturali)
# (histogram stretch) (falsi colori)
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# Esercizio: caricare l'immagine del 1988
l1988 <- brick("p224r63_1988.grd")

# Costruire un multriframe per confrontare l'immagine del 1988 con quella del 2011
par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="hist")
