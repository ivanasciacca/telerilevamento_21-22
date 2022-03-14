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

