# Il mio codice in R per il telerilevamento

# install.packages("raster")
library(raster)

# Settaggio cartella di lavoro 
setwd("C:/lab/")

# Importiamo immagine satellitare e assegnamo all'ogetto l2011 la funzione
l2011 <- brick("p224r63_2011.grd")
l2011

#
plot(l2011)

# cambiare colore delle immagini
cl <- colorRampPalette (c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

#Landsat ETM+
# b1 = blu 
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# plot della banda del blu b1 - B1_sre
plot(l2011$B1_sre)
# plot dell'elemento
plot(l2011[[1]])

cl <- colorRampPalette (c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre , col=cl)

# plot b1 da dark blue a light blue
clb <- colorRampPalette (c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre , col=clb)

# esportiamo l'immagine nella cartella lab come pdf (solo il plot, non i dati)
pdf("banda1.pdf")
plot(l2011$B1_sre, col=clb)
dev.off()

# steso procedimento per esportare l'immagine (solo il plot, non i dati) con la funzione png
png("banda1.png")
plot(l2011$B1_sre, col=clb)
dev.off()

# plot b2 da dark green a light green
clg <- colorRampPalette (c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre , col=clg)

# multiframe 1 riga e 2 colonne
par(mfrow=c(1,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# esportiamo multiframe plot
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# invertiamo il multiframe 2 righe e 1 colonna
par(mfrow=c(2,1))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# plot b3 da dark red a pink 
clr <- colorRampPalette (c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre , col=clr)

# plot b4 da red a orange, da orange a yellow
clnir <- colorRampPalette (c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre , col=clnir)

# creiamo il multiframe con 2 righe e 2 colonne 
par(mfrow=c(2,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
plot(l2011$B3_sre , col=clr)
plot(l2011$B4_sre , col=clnir)
