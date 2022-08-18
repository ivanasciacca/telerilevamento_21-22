# Richiamare la libreria raster
library(raster)

# Installare RStoolbox
install.packages('RStoolbox')
library(RStoolbox)

# Settare la cartella di lavoro
setwd("C:/lab/")

# Importare i dati
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

# rosso = 1
# verde = 2
# blu = 3

# Plot con lo schema RBG
plotRGB(gc, r=1, g=2, b=3, stretch="lin")

plotRGB(gc, r=1, g=2, b=3, stretch="hist")

# Classificazione dei dati in due classi
gcclass2 <- unsuperClass(gc, nClasses=2)
gcclass2

# Plot della mappa utilizziamo il simbolo $ che lega l'oggetto gcclass2 al proprio oggetto principale map 
plot(gcclass2$map)

# Classe 1 = bianco, corrisponde alla roccia 
# Classe 2 = verde, corrisponde all'acqua, alle ombre e differenze mineralogiche 

# Esercizio: classificazione della mappa in 4 classi
gcclass4 <- unsuperClass(gc, nClasses=4)
gcclass4

# Utilizzare questa leggenda 
clc <- colorRampPalette(c('yellow', 'red', 'blue', 'black')) (100)
plot(gcclass4$map, col=clc)

# Classe 1 = giallo, sabbie 
# Classe 2 = rossa, roccia composizione mineralogica diversa da quella in blu
# Classe 3 = blu, roccia
# Classe 4 = nero, acqua e ombre

# Comparare la classificazione della mappa con il set originale 
par(mfrow=c(2,1))
plot(gcclass4$map, col=clc)
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
