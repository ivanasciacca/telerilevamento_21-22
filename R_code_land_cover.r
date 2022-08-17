# Richiamare le librerie da utilizzare
library(raster)
library(RStoolbox) # per la classificazione

# install.packages("ggplot2")
install.packages("ggplot2")
library(ggplot2)

# install.packages("patchwork")
install.packages("patchwork")
library(patchwork)

# Settaggio della cartella di lavoro
setwd("C:/lab/")

# La funzione brick importa l'intera immagine satellitare, ovvero l'intero pacchetto di dati (defor1)
l92 <- brick("defor1_.jpg")
plotRGB(l92, 1, 2, 3, stretch="lin")

# Esercizio: importa l'immagine defor2
l06 <- brick("defor2_.jpg")

# Creare un multiframe con le immagini l92 e l06 in due righe e una colonna, utilizzando lo stretch lineare
# NIR = 1
# r = 2
# g = 3
par(mfrow=c(2,1))
plotRGB(l92, 1, 2, 3, stretch="lin")
plotRGB(l06, 1, 2, 3, stretch="lin")

# Creare un multiframe con il pacchetto ggplot2 e patchwork
p1 <- ggRGB(l92, 1, 2, 3, stretch="lin")
p2 <- ggRGB(l06, 1, 2, 3, stretch='lin')
p1+p2 # sulla stessa riga 
p1/p2 # sulla stessa colonna

# Classificazione immagine del 1992, in 2 classi
l92c <- unsuperClass(l92, nClasses=2)
l92c
plot(l92c$map)
# classe 1: foresta
# classe 2: area agricola e acqua

# Esercizio: classificare l'immagine del 2006, in 2 classi
l06c <- unsuperClass(l06, nClasses=2)
l06c
plot(l06c$map)
# classe 1: area agricola e acqua
# classe 2: foresta

# frequenza

freq(l92c$map)
# class 1: 305802 pixels
# class 2:  35490 pixels

freq(l06c$map)
# class 1: 163444 pixels
# class 2: 179282 pixels

## proporzioni
tot92 <- 341292
prop_forest_92 <- 305802 / tot92
prop_forest_92

# percentuale 
tot92 <- 341292
perc_forest_92 <- 305802 * 100 / tot92
perc_forest_92

# esercizio: calcolare la percentuale di area agricola nel 1992
perc_agr_92 <- 100 - perc_forest_92
perc_agr_92

# percent_forest_92: 89.60128
# percent_agr_92: 10.39872


# percentuale del 2006
tot_06 <- 342726
percent_forest_06 <- 179282 *100 / tot_06
percent_forest_06

percent_agr_06 <- 100 - percent_forest_06
percent_agr_06

# percent_forest_06: 52.31059
# percent_agr_06: 47.68941

# DATI FINALI
# percent_forest_92: 89.60128
# percent_agr_92: 10.39872
# percent_forest_06: 52.31059
# percent_agr_06: 47.68941

# costruire un dataframe con questi dati
# Colonne (campi)
class <- c("Forest", "Agriculture")
percent_1992 <- c(89.60128, 10.39872)
percent_2006 <- c(52.31059, 47.68941)

multitemporal <- data.frame(class, percent_1992, percent_2006)
multitemporal 
View(multitemporal)

# 1992
ggplot(multitemporal, aes(x=class, y=percent_1992, color=class)) +
geom_bar(stat="identity", fill="white")

# 2006
ggplot(multitemporal, aes(x=class, y=percent_2006, color=class)) +
geom_bar(stat="identity", fill="white")

#pdf
pdf("percentages_1992.pdf")
ggplot(multitemporal, aes(x=class, y=percent_1992, color=class)) +
geom_bar(stat="identity", fill="white")
dev.off()

pdf("percentages_2006.pdf")
ggplot(multitemporal, aes(x=class, y=percent_2006, color=class)) +
geom_bar(stat="identity", fill="white")
dev.off()
