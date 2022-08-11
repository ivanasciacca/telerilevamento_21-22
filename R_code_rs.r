# Il mio codice in R per il telerilevamento

# install.packages("raster")
library(raster)

# Settaggio cartella di lavoro 
setwd("C:/lab/")

# Importare l'immagine satellitare e assegnare all'ogetto l2011 la funzione brick
l2011 <- brick("p224r63_2011.grd")
l2011

# Visualizzare l'immagine l2011
plot(l2011)

# Cambiare i colori della leggenda di ogni singola banda per analizzare la riflettanza (bassa riflettanza = balck, alta riflettanza = light grey)
cl <- colorRampPalette (c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)

# Landsat ETM+
# b1 = blu 
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino NIR

# Plot della banda del blu (b1)  B1_sre
# Utizzare il simbolo $ per legare la banda B1_sre al dataset 
plot(l2011$B1_sre)
# Altro metodo
# Plot del primo elemento, ovvero la banda del blu ed utilizzare le [[]] per indicare l'elemento
plot(l2011[[1]])

# Modificare la leggenda della banda b1
cl <- colorRampPalette (c("black", "grey", "light grey")) (100)
plot(l2011$B1_sre , col=cl)

# Plot della banda b1 e cambiare la leggenda che va da dark blue, a blue fino a light blue
clb <- colorRampPalette (c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre , col=clb)

# Esportare l'immagine nella cartella lab come pdf (solo il plot, non i dati)
pdf("banda1.pdf")
plot(l2011$B1_sre, col=clb)
dev.off()

# Stesso procedimento per esportare l'immagine (solo il plot, non i dati) con la funzione png
png("banda1.png")
plot(l2011$B1_sre, col=clb)
dev.off()

# Plot della banda b2 e modificare la leggenda con i colori che vanno dal dark green, al green, al light green
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

# Invertire il multiframe in 2 righe e 1 colonna
par(mfrow=c(2,1))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
dev.off()

# Plot della banda b3, utilizzando la leggenda che va da dark red, a red e infine a pink 
clr <- colorRampPalette (c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre , col=clr)

# Plot della banda b4, con una leggenda che va da red a orange, da orange a yellow
clnir <- colorRampPalette (c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre , col=clnir)

# Creare un multiframe con 2 righe e 2 colonne 
par(mfrow=c(2,2))
plot(l2011$B1_sre , col=clb)
plot(l2011$B2_sre , col=clg)
plot(l2011$B3_sre , col=clr)
plot(l2011$B4_sre , col=clnir)


# Day #3

# Esercizio: plot dell'immagine l2011 nella banda NIR
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)
# Oppure
plot(l2011[[4]])

# Plot RGB layers. Stretch, argomento che serve ad ampliare i valori per vedere meglio i contrasti tra i colori, pò essere lin= lineare o hist= istogrammi
# Visualizzazione a colori naturali
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
# Rosso = la vegetazione
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
# In verde la foresta
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
# Immagine blu, in giallo parte nuda, zone agricole aperte
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")
# Hist lavora per istogrammi, i valori medi saranno più enfatizzati 
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
