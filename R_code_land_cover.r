#
library(raster)
library(RStoolbox) # per la classificazione

# install.packages("ggplot2")
install.packages("ggplot2")
library(ggplot2)

# install.packages("patchwork")
install.packages("patchwork")
library(patchwork)

setwd("C:/lab/")

# brick importa l'intera immagine satellitare 
# NIR 1
# r 2
# g 3

l92 <- brick("defor1_.jpg")
plotRGB(l92, 1, 2, 3, stretch="lin")

# esercizio: 
l06 <- brick("defor2_.jpg")

par(mfrow=c(2,1))
plotRGB(l92, 1, 2, 3, stretch="lin")
plotRGB(l06, 1, 2, 3, stretch="lin")

#
p1 <- ggRGB(l92, 1, 2, 3, stretch="lin")
p2 <- ggRGB(l06, 1, 2, 3, stretch="lin")
p1+p2 # sulla stessa riga 
p1/p2 # sulla stessa colonna

# classificazione immagine del 1992
l92c <- unsuperClass(l92, nClasses=2)
l92c
plot(l92c$map)
# class 1: foresta
# class 2: area agricola e acqua

# classificazione immagine del 2006
l06c <- unsuperClass(l06, nClasses=2)
l06c
plot(l06c$map)
# class 1: area agricola e acqua
# class 2: foresta

# frequenza

freq(l92c$map)
# class 1: 305802 pixels
# class 2:  35490 pixels

freq(l06c$map)
# class 1: 163444 pixels
# class 2: 179282 pixels
