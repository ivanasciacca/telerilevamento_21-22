# Analizzare l'andamento della deforestazione negli ultimi venti anni in Bolivia, vicino al distretto di Santa Cruz.
# Le immagini utilizzate sono state prese dai satelliti Landsat 7 (20/06/2002) e Landsat 8 (19/10/2014 - 14/08/2022) p230r072.
# Le immagini sono state scaricate dal seguente sito: https://earthexplorer.usgs.gov/


# Richiamare tutte le librerie da utilizzare 
library(raster) # per l'utilizzo di data raster
library(RStoolbox) # per la classificazione delle immagini
library(ggplot2) # per la grafica
library(patchwork) # semplifica la creazione di layout in ggplot con più pannelli
library(viridis) # leggende a colori per migliorare la leggibilità delle immagini


# Settare la cartella di lavoro Santa Cruz che è interna alla cartella lab
setwd("C:/lab/Santa Cruz")



   ## IMPORTAZIONE DATI DEL 2002  ##
  
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

# La funzione stack consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2002 <- stack(rlist02)
ln2002
plot(ln2002)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 3, g = 2, b = 1 
plotRGB(ln2002, 3, 2, 1, stretch="lin")

# Falsi colori inserendo la banda 4 dell'infrarosso vicino g = 4
 plotRGB(ln2002, 3, 4, 2, stretch="lin")

# Salvare le immagini in RGB sia a colori naturali che in falsi colori, con la funzione jpeg
jpeg("ln2002.jpeg")
plotRGB(ln2002, 3, 2, 1, stretch="lin")
dev.off()

jpeg("ln2002fc.jpeg")
plotRGB(ln2002, 3, 4, 2, stretch="lin")
dev.off()


   ##  IMPORTAZIONE DATI DEL 2014  ##
  
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

# La funzione stack consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2014 <- stack(rlist14)
ln2014
plot(ln2014)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 4, g = 3, b = 2 
plotRGB(ln2014, 4, 3, 2, stretch="lin")

# Falsi colori inserendo la banda 5 del NIR, g = 5 
 plotRGB(ln2014, 4, 5, 3, stretch="lin")

# Salvare l'immagine in RGB sia a colori naturali che con i falsi colori, con la funzione jpeg
jpeg("ln2014.jpeg")
plotRGB(ln2014, 4, 3, 2, stretch="lin")
dev.off()

jpeg("ln2014fc.jpeg")
plotRGB(ln2014, 4, 5, 3, stretch="lin")
dev.off()


   ## IMPORTAZIONE DATI DEL 2022 ##

# Caricare i RasterLayer delle singole bande del 2022

   ### Bande Landsat 8 ###
# B1 = banda coastal/aerosol
# B2 = banda del blu
# B3 = banda del verde
# B4 = banda del rosso
# B5 = banda de NIR 

B1_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B1.tif")
B1_2022

B2_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B2.tif")
B2_2022

B3_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B3.tif")
B3_2022

B4_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B4.tif")
B4_2022

B5_2022 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B5.tif")
B5_2022

# Importare i dati tutti insieme, tramite la funzione list che crea una lista di file
rlist22 <- list(B1_2022, B2_2022, B3_2022, B4_2022, B5_2022)

# La funzione stack consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2022 <- stack(rlist22)
ln2022
plot(ln2022)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 3, g = 2, b = 1 
plotRGB(ln2022, 3, 2, 1, stretch="lin")

# Falsi colori inserendo la banda 5 del NIR, g = 5 
plotRGB(ln2022, 4, 5, 3, stretch="lin")

# Salvare l'immagine in RGB sia a colori naturali che con i falsi colori, con la funzione jpeg
jpeg("ln2022.jpeg")
plotRGB(ln2022, 3, 2, 1, stretch="lin")
dev.off()

jpeg("ln2022fc.jpeg")
plotRGB(ln2022, 4, 5, 3, stretch="lin")
dev.off()


# Creare un multiframe con la funzione par(mfrow) per confrontare le immagini del 2002, 2014 e 2022 sia a colori naturali che in falsi colori. 
# Salvare l'immagine in jpeg
jpeg("ln02_14_22.jpeg")
par(mfrow=c(2,3))
plotRGB(ln2002, 3, 2, 1, stretch="lin")
plotRGB(ln2014, 3, 2, 1, stretch="lin")
plotRGB(ln2022, 3, 2, 1, stretch="lin")
plotRGB(ln2002, 3, 4, 2, stretch="lin")
plotRGB(ln2014, 4, 5, 3, stretch="lin")
plotRGB(ln2022, 4, 5, 3, stretch="lin")
dev.off()



   ## INDICI SPETTRALI DI VEGETAZIONE ##

 # Calcolare il DVI del 2002 
dviln2002 = ln2002[[4]] - ln2002[[3]]
dviln2002

# Plottare l'immagine utilizzando una colorRampPalette e salvare in jpeg
jpeg("dviln2002.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2002, col=cl)
dev.off()

# In rosso sono indicate le zone con elevato indice DVI, quindi la vegetaione è in salute.
# In giallo l'indice DVI è più basso, indica il suolo nudo. In blu rappresenta l'acqua dei fiumi e laghi.

 # Calcolare il DVI del 2014 
dviln2014 = ln2014[[5]] - ln2014[[4]]
dviln2014

# Plottare l'immagine utilizzando una colorRampPalette e salvare in jpeg
jpeg("dviln2014.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2014, col=cl)
dev.off()

# In rosso alto indice DVI, in giallo basso indice DVI. Al centro aumenta la deforestazione, in alto la colorazione rossa indica le aree dei campi coltivati.
# Quindi spesso con l'indice DVI non si riesce a distiguere una foresta in salute da un campo coltivato con elevata vegetazione.

 # Calcolare il DVI del 2022 
dviln2022 = ln2022[[5]] - ln2022[[4]]
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

# Plottare e salvare in jpeg, la differenza di DVI dal 2002 al 2022 con una leggenda costruita tramite la funzione colorRampPalette
jpeg("dvi_dif.jpeg")
cld <- colorRampPalette(c('blue','white','magenta'))(100)
plot(dvi_dif, col=cld)
dev.off()

# Con il color magenta vengono individuate le zone dove varia l'indice DVI nel corso degli ultimi vent'anni.

 # Calcolare e plottare NDVI del 2002
ndviln2002 = dviln2002 / (ln2002[[4]] + ln2002[[3]])
ndviln2002

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2002, col=cl)

 # Calcolare e plottare NDVI del 2014
ndviln2014 = dviln2014 / (ln2014[[5]] + ln2014[[4]])
ndviln2014

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2014, col=cl)

 # Calcolare e plottare NDVI del 2022
ndviln2022 = dviln2022 / (ln2022[[5]] + ln2022[[4]])
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


   ## LAND COVER ##

 # Classificare l'immagine del 2002 in tre classi
# Classe 1 = zona forestale (bianco)
# Classe 2 = suolo agricolo (giallo)
# Classe 3 = centri urbani (verde)

ln2002nC <- unsuperClass(ln2002, nClasses=3)
ln2002nC
jpeg("Perc_2002.jpeg")
plot(ln2002nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln2002nC$map)

# Classe 1 = 23292002
# Classe 2 = 5802788
# Classe 3 = 8891051
# NA = 17433870 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2002
tot2002 <- 55419711

perc_forest_2002 <- 23292002 * 100 / tot2002
perc_forest_2002
# Percentuale foresta = 42.02837

perc_agr_2002 <- 5802788 * 100 / tot2002
perc_agr_2002
# Percentuale suolo agricolo = 10.47062

perc_city_2002 <- 8891051 * 100 / tot2002
perc_city_2002
# Percentuale di centri urbani =  16.04312


 # Classificare l'immagine del 2014 in tre classi
# Classe 1 = zona forestale (bianca)
# Classe 2 = suolo agricolo (gialla)
# Classe 3 = centro urbano (verde)

ln2014nC <- unsuperClass(ln2014, nClasses=3)
ln2014nC
jpeg("Perc_2014.jpeg")
plot(ln2014nC$map)
dev.off() 

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln2014nC$map)

# Classe 1 = 15163967 
# Classe 2 = 16442160
# Classe 3 = 9075738
# NA = 18928376 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2014
tot2014 <- 59610241 

perc_forest_2014 <- 15163967 * 100 / tot2014
perc_forest_2014
# Percentuale foresta = 25.43853

perc_agr_2014 <- 16442160 * 100 / tot2014
perc_agr_2014
# Percentuale zona agricola = 27.58278

perc_city_2014 <- 9075738 * 100 / tot2014
perc_city_2014
# Percentuale centri urbani = 15.22513


 # Classificare l'immagine del 2022 in tre classi
# Classe 1 = suolo agricolo (bianco) 
# Classe 2 = centro urbano? (giallo)
# Classe 3 = zona forestale (verde)

ln22nC <- unsuperClass(ln2022, nClasses=3)
ln22nC
jpeg("Perc_2022.jpeg")
plot(ln22nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln22nC$map)

# Classe 1 = 20359974 
# Classe 2 = 299648
# Classe 3 = 20134286 
# NA 18663113 (non applicabile)

# Calcolare la percentuale di foresta e di area agricola del 2022
tot22 <- 59457021

perc_forest_22 <- 20134286  * 100 / tot22
perc_forest_22
# Percentuale zona foresta = 33.8636

perc_agr_22 <- 20359974  * 100 / tot22
perc_agr_22
# Percentuale suolo agricolo =  34.24318 

perc_city_22 <- 299648 * 100 / tot22
perc_city_22
# Percentuale centro urbano =  0.5039741

# Costruire un dataframe con i dati percentuali dell'area forestale, del suolo agricolo e del centro urbano
# Colonne (campi)
class <- c("Forest", "Agriculture", "City")
percent_2002 <- c(23292002,5802788,8891051)
percent_2014 <- c(15163967,16442160,9075738)
percent_2022 <- c(20134286,20359974,299648)

multitemporal <- data.frame(class, percent_2002, percent_2014, percent_2022)
multitemporal

# Visualizzare in formato tabella
View(multitemporal)



   ## ANALISI MULTIVARIATA ##

# 2002

ln2002_pca <- rasterPCA(ln2002)
ln2002_pca

# Summery è una funzione generica che riepiloga i risulati ottenuti con altre funzioni utilizzate
# Importance of components: quanto spiega della variabilità iniziale ogni singola componente
summary(ln2002_pca$model)

# Plot della mappa
plot(ln2002_pca$map)

#
