# Analizzare l'andamento della deforestazione negli ultimi venti anni in Bolivia, esattamente nel distretto di Santa Cruz.
# Le immagini utilizzate sono state prese dai satelliti Landsat 7 (2002) e Landsat 8 (2014, 2022).



# Richiamare tutte le librerie da utilizzare 
library(raster)
library(RStoolbox) # per la classificazione delle immagini
library(ggplot2) # per la grafica
library(patchwork)
library(viridis) # leggende a colori per migliorare la leggibilità delle immagini


# Settare la cartella di lavoro Santa Cruz che è interna alla cartella lab
setwd("C:/lab/Santa Cruz")



   ##  2002  ##
  
# Caricare i RasterLayer delle singole bande del 2002
# B1 = banda del blu
# B2 = banda del verde
# B3 = banda del rosso
# B4 = banda de NIR

B1_2002 <- raster("LE07_L2SP_230072_20020620_20200916_02_T1_SR_B1.tif")
B1_2002

B2_2002 <- raster("LE07_L2SP_230072_20020620_20200916_02_T1_SR_B2.tif")
B2_2002

B3_2002 <- raster("LE07_L2SP_230072_20020620_20200916_02_T1_SR_B3.tif")
B3_2002

B4_2002 <- raster("LE07_L2SP_230072_20020620_20200916_02_T1_SR_B4.tif")
B4_2002

# Importare i dati tutti insieme, tramite la funzione list che crea una lista di file
rlist02 <- list(B1_2002, B2_2002, B3_2002, B4_2002)

# La funzione stack ci consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2002 <- stack(rlist02)
ln2002
plot(ln2002)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 3, g = 2, b = 1 
plotRGB(ln2002, 3, 2, 1, stretch="lin")

# Salvare l'immagine in RGB con la funzione jpeg
jpeg("ln2002.jpeg")
plotRGB(ln2002, 3, 2, 1, stretch="lin")
dev.off()


   ##  2014  ##
  
# Caricare i RasterLayer delle singole bande del 2014

  ### Bande Landsat 8 ###
# B1 = banda coastal/aerosol
# B2 = banda del blu
# B3 = banda del verde
# B4 = banda del rosso
# B5 = banda de NIR 

B1_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B1.tif")
B1_2014

B2_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B2.tif")
B2_2014

B3_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B3.tif")
B3_2014

B4_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B4.tif")
B4_2014

B5_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B5.tif")
B5_2014

# Importare i dati tutti insieme, tramite la funzione list che crea una lista di file
rlist14 <- list(B1_2014, B2_2014, B3_2014, B4_2014, B5_2014)

# La funzione stack ci consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2014 <- stack(rlist14)
ln2014
plot(ln2014)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 4, g = 3, b = 2 
plotRGB(ln2014, 4, 3, 2, stretch="lin")

# Falsi colori
 plotRGB(ln2014, 4, 5, 3, stretch="lin")

# Salvare l'immagine in RGB con la funzione jpeg
jpeg("ln2014.jpeg")
plotRGB(ln2014, 4, 3, 2, stretch="lin")
dev.off()


   ## 2022 ##

# Caricare i RasterLayer delle singole bande del 2022

   ### Bande Landsat 8 ###
# B1 = banda coastal/aerosol
# B2 = banda del blu
# B3 = banda del verde
# B4 = banda del rosso
# B5 = banda de NIR (da inserire)

B1_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B1.tif")
B1_2022

B2_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B2.tif")
B2_2022

B3_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B3.tif")
B3_2022

B4_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B4.tif")
B4_2022

# Importare i dati tutti insieme, tramite la funzione list che crea una lista di file
rlist22 <- list(B1_2022, B2_2022, B3_2022, B4_2022)

# La funzione stack ci consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2022 <- stack(rlist22)
ln2022
plot(ln2022)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 3, g = 2, b = 1 
plotRGB(ln2022, 3, 2, 1, stretch="lin")

# Salvare l'immagine in RGB con la funzione jpeg
jpeg("ln2022.jpeg")
plotRGB(ln2022, 3, 2, 1, stretch="lin")
dev.off()


# Creare un multiframe con la funzione par(mfrow) per confrontare le immagini del 2002, 2014 e 2022
par(mfrow=c(1,3))
plotRGB(ln2002, 3, 2, 1, stretch="lin")
plotRGB(ln2014, 3, 2, 1, stretch="lin")
plotRGB(ln2022, 3, 2, 1, stretch="lin")



   ## Indici spettrali di vegetazione ##

# Calcolare il DVI del 2002 
dviln2002 = ln2002[[4]] - ln2002[[3]]
dviln2002

# Plottare l'immagine utilizzando una colorRampPalette e salvare in jpeg
jpeg("dviln2002.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2002, col=cl)
dev.off()

# In rosso sono indicate le zono con elevato indice DVI, quindi la vegetaione è in salute.
# In giallo l'indice DVI è più basso, indica il suolo nudo. In blu rappresenta l'acqua dei fiumi e laghi.

# Calcolare il DVI del 2014 
dviln2014 = ln2014[[5]] - ln2014[[4]]
dviln2014

# Plottare l'immagine utilizzando una colorRampPalette e salvare in jpeg
jpeg("dviln2014.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2014, col=cl)
dev.off()

# In rosso alto indice DVI, in giallo basso indice DVI.

# Calcolare il DVI del 2022 
dviln2022 = ln2022[[4]] - ln2022[[3]]
dviln2022

# Plottare l'immagine utilizzando una colorRampPalette e salvare in jpeg
jpeg("dviln2022.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2022, col=cl)
dev.off()

# L'area in giallo si estende, ciò segnala un peggioramento dello stato di salute della vegetazione.


# Calcolare la differenza di DVI nell'ultimo ventennio 2002 - 2022
# I due DVI hanno estenzione diverse, quindi bisogna adattare l'estenzione del dvi22 basandoci su quella del dvi02 grazie alla funzione resample 
dviln2022r = resample(dviln2022, dviln2002)

dvi_dif = dviln2002 - dviln2022r
dvi_dif

# Plottare e salvare in jpeg, la differenza di DVI dal 2002 al 2022 con una leggenda costruita con la dunzione colorRampPalette
jpeg("dvi_dif.jpeg")
cld <- colorRampPalette(c('blue','white','magenta'))(100)
plot(dvi_dif, col=cld)
dev.off()

# Con il color magenta vengono individuate le zone dove varia l'indice DVI nel corso degli ultimi vent'anni.

# Calcolare e plottare NDVI del 2002
ndviln2002 = dviln2002 / ln2002[[4]] + ln2002[[3]]
ndviln2002

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2002, col=cl)

# Calcolare e plottare NDVI del 2014
ndviln2014 = dviln2014 / ln2014[[5]] + ln2014[[4]]
ndviln2014

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2014, col=cl)

# Calcolare e plottare NDVI del 2022
ndviln2022 = dviln2022 / ln2022[[4]] + ln2022[[3]]
ndviln2022

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2022, col=cl)


# Creare un multiframe per poter mettere a confronto NDVI del 2002, 2014 e 2022 e salvare in jpeg
jpeg("ndvi.jpeg")
par(mfrow=c(1,3))
plot(ndviln2002, col=cl)
plot(ndviln2014, col=cl)
plot(ndviln2022, col=cl)
dev.off()

# NDVI è l'indice DVI normalizzato, quindi quelli relativi al 2014 e 2022 non devono essere ricampionati.


   ## Land cover ##

# Classificare l'immagine del 2002 in due classi
# Classe 1 = zona forestale (bianco)
# Classe 2 = suolo agricolo (verde)

ln2002nC <- unsuperClass(ln2002, nClasses=2)
ln2002nC

jpeg("ln2002nC")
plot(ln2002nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln2002nC$map)

# Classe 1 = 25037359
# Classe 2 = 12948482
# NA 17433870 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2002
tot2002 <- 55419711

perc_forest_2002 <- 25037359 * 100 / tot2002
perc_forest_2002
# Percentuale foresta = 45.17771

perc_agr_2002 <- 12948482 * 100 / tot2002
perc_agr_2002
# Percentuale suolo agricolo = 23.3644



# Classificare l'immagine del 2014 in due classi
# Classe 1 = zona forestale (bianco)
# Classe 2 = suolo agricolo (verde)

ln2014nC <- unsuperClass(ln2014, nClasses=2)
ln2014nC

jpeg("ln2014nC")
plot(ln2014nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln2014nC$map)

# Classe 1 = 23641752
# Classe 2 = 17040113
# NA 18928376 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2014
tot2014 <- 59610241 

perc_forest_2014 <- 23641752 * 100 / tot2014
perc_forest_2014
# Percentuale foresta = 39.66055

perc_agr_2014 <- 17040113 * 100 / tot2014
perc_agr_2014
# Percentuale zona agricola = 28.58588



# Classificare l'immagine del 2022 in due classi

   ## Prova 1 ##

# Classe 1 = zona forestale (bianco) 
# Classe 2 = suolo agricolo (verde)

ln22nC <- unsuperClass(ln2022, nClasses=2)
ln22nC

jpeg("ln22nC")
plot(ln22nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln22nC$map)

# Classe 1 = 40480835
# Classe 2 = 313073
# NA 18663113 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2022
tot22 <- 59457021

perc_forest_22 <- 40480835 * 100 / tot22
perc_forest_22
# Percentuale foresta = 68.0842

perc_agr_22 <- 313073 * 100 / tot22
perc_agr_22
# Percentuale zona agricola =  0.5265535


  ## Prova 2 ##
# Classe 1 = suolo agricolo (bianco)
# Classe 2 = zona forestale (verde) 

ln2022nC <- unsuperClass(ln2022, nClasses=2)
ln2022nC

jpeg("ln2022nC")
plot(ln2022nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln2022nC$map)

# Classe 1 = 12807531
# Classe 2 = 27986377
# NA 18663113 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2022
tot2022 <- 59457021

perc_forest_2022 <- 27986377 * 100 / tot2022
perc_forest_2022
# Percentuale foresta = 47.06993

perc_agr_2022 <- 12807531 * 100 / tot2022
perc_agr_2022
# Percentuale zona agricola =  21.54082

# La classificazione dell'immagine del 2022, porta a due risultati diversi prova 1 e prova 2.
# Una possibile spiegazione può essere data da un elevato numero di pixel NA, cioè pixel non associati a nessuna delle due classi.
# La prova 2 è quella che si avvicina di più al risultato atteso, ma comunque poco affidabile.

# Costruire un dataframe con i dati percentuali dell'area forestale e del suolo agricolo
# Colonne (campi)
class <- c("Forest", "Agriculture")
percent_2002 <- c(45.17771, 23.3644)
percent_2014 <- c(39.66055, 28.58588)
percent_2022 <- c(47.06993, 21.54082)

multitemporal <- data.frame(class, percent_2002, percent_2014, percent_2022)
multitemporal

# Visualizzare in formato tabella
View(multitemporal)

   

