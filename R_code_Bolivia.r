                                                        ## DEFORESTAZIONE IN BOLIVIA ##
                                           
# Lo scopo di questo progetto è di analizzare la deforestazione nell'ultimo ventennio nel dipartimento di Santa Cruz in Bolivia, 
# causata da deforestazione legale e illegale per dare spazio a campi agricoli e allevamenti.

# Verranno confrontate le immagini satellitari del 24/09/2002 di Landsat 7 e quella del 01/10/2022 di Landsat 8-9.
# Path: 230 e Row: 072
# Le immagini satellitari sono state recuperate dal seguente sito: https://earthexplorer.usgs.gov/



# Richiamare tutte le librerie da utilizzare 

library(raster) # per l'utilizzo di data raster
library(RStoolbox) # per visualizzare le immagini e per calcolare la variabilità
library(ggplot2) # per visualizzare i ggplot
library(patchwork) # creazione di multiframe con i grafici ggplot2 
library(viridis) # leggende a colori per migliorare la leggibilità delle immagini

# Settare la cartella di lavoro Bolivia, che è interna alla cartella lab
setwd("C:/lab/Bolivia")


                                          ## IMPORTAZIONE DEI DATI DEL 2002 ##

# Caricare i RasterLayer delle singole bande del 2002
# B1 = banda del blu
# B2 = banda del verde
# B3 = banda del rosso
# B4 = banda del NIR

B1_2002 <- raster("LE07_L2SP_230072_20020924_20200916_02_T1_SR_B1.tif")
B1_2002

B2_2002 <- raster("LE07_L2SP_230072_20020924_20200916_02_T1_SR_B2.tif")
B2_2002

B3_2002 <- raster("LE07_L2SP_230072_20020924_20200916_02_T1_SR_B3.tif")
B3_2002

B4_2002 <- raster("LE07_L2SP_230072_20020924_20200916_02_T1_SR_B4.tif")
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


                                                  ## IMPORTAZIONE DEI DATI DEL 2022 ##
                                            
# Caricare i RasterLayer delle singole bande del 2022
# B1 = banda coastal/aerosol
# B2 = banda del blu
# B3 = banda del verde
# B4 = banda del rosso
# B5 = banda del NIR 

B1_2022 <- raster("LC09_L2SP_230072_20221001_20221003_02_T1_SR_B1.tif")
B1_2022

B2_2022 <- raster("LC09_L2SP_230072_20221001_20221003_02_T1_SR_B2.tif")
B2_2022

B3_2022 <- raster("LC09_L2SP_230072_20221001_20221003_02_T1_SR_B3.tif")
B3_2022

B4_2022 <- raster("LC09_L2SP_230072_20221001_20221003_02_T1_SR_B4.tif")
B4_2022

B5_2022 <- raster("LC09_L2SP_230072_20221001_20221003_02_T1_SR_B5.tif")
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

# Creare un multiframe con la funzione par(mfrow) per confrontare le immagini del 2002 e 2022 sia a colori naturali che in falsi colori. 
# Salvare l'immagine in jpeg
jpeg("ln02_22.jpeg")
par(mfrow=c(2,2))
plotRGB(ln2002, 3, 2, 1, stretch="lin")
plotRGB(ln2022, 3, 2, 1, stretch="lin")
plotRGB(ln2002, 3, 4, 2, stretch="lin")
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

 # Calcolare il DVI del 2022 
dviln2022 = ln2022[[5]] - ln2022[[4]]
dviln2022

# Plottare l'immagine utilizzando una colorRampPalette e salvare in jpeg
jpeg("dviln2022.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2022, col=cl)
dev.off()

# Calcolare la differenza di DVI nell'ultimo ventennio 2002 - 2022
# I due DVI hanno estensione diverse, quindi bisogna adattare l'estensione del dvi22 basandoci su quella del dvi02 grazie alla funzione resample 
dviln2022r = resample(dviln2022, dviln2002)

dvi_dif = dviln2002 - dviln2022r
dvi_dif

# Plottare e salvare in jpeg, la differenza di DVI dal 2002 al 2022 con una leggenda costruita tramite la funzione colorRampPalette
jpeg("dvi_dif.jpeg")
cld <- colorRampPalette(c('blue','white','magenta'))(100)
plot(dvi_dif, col=cld)
dev.off()

 # Calcolare e plottare NDVI del 2002
ndviln2002 = dviln2002 / (ln2002[[4]] + ln2002[[3]])
ndviln2002

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2002, col=cl)

 # Calcolare e plottare NDVI del 2022
ndviln2022 = dviln2022 / (ln2022[[5]] + ln2022[[4]])
ndviln2022

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2022, col=cl)

# Creare un multiframe per poter mettere a confronto NDVI del 2002 e 2022 e salvare in jpeg
jpeg("ndvi.jpeg")
par(mfrow=c(1,3))
plot(ndviln2002, col=cl)
plot(ndviln2022, col=cl)
dev.off()

# NDVI è l'indice DVI normalizzato, quindi quello relativo al 2022 non deve essere ricampionato


                                                              ## LAND COVER ##
                                                              
# Classificare l'immagine del 2002 in tre classi: 
# Classe 1: Suolo nudo (bianco)
# Classe 2: Area forestale (giallo)
# Classe 3: Zona agricola (verde)

ln2002nC <- unsuperClass(ln2002, nClasses=3)
ln2002nC
jpeg("Perc_2002.jpeg")
plot(ln2002nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln2002nC$map)

# Classe 1 = 16168804
# Classe 2 = 11412467
# Classe 3 = 10431515
# NA = 17477335 (non applicabile)

tot2002 <- 55490121 

perc_forest_2002 <- 11412467 * 100 / tot2002
perc_forest_2002
# Percentuale di foresta = 20.56666

perc_agr_2002 <- 10431515 * 100 / tot2002
perc_agr_2002
# Percentuale di suolo agricolo = 18.79887

perc_suolo_2002 <- 16168804 * 100 / tot2002
perc_suolo_2002
# Percentuale di suolo nudo = 29.13817 


# Classificare l'immagine del 2022 in tre classi: 
# Classe 1: Zona agricola (bianco)
# Classe 2: Area forestale (giallo)
# Classe 3: Suolo nudo (verde)

ln22nC <- unsuperClass(ln2022, nClasses=3)
ln22nC
jpeg("Perc_2022.jpeg")
plot(ln22nC$map)
dev.off()

# Calcolare la frequenza dei pixel che appartengono a ciascuna classe 
freq(ln22nC$map)

# Classe 1 = 15275272
# Classe 2 = 11853613
# Classe 3 = 13687516
# NA 18640620 (non applicabile)

tot22 <- 59457021

perc_forest_22 <- 11853613  * 100 / tot22
perc_forest_22
# Percentuale di foresta = 19.93644

perc_agr_22 <- 15275272 * 100 / tot22
perc_agr_22
# Percentuale di suolo agricolo =  25.69128

perc_suolo_22 <- 13687516 * 100 / tot22
perc_suolo_22
# Percentuale di suolo nudo = 23.02086

# Costruire un dataframe con i dati percentuali dell'area forestale, della zona agricola e del suolo nudo
# Colonne (campi)
class <- c("Foresta", "Agricoltura", "Suolo")
percent_2002 <- c(11412467,10431515,16168804)
percent_2022 <- c(11853613, 15275272,13687516)

multitemporal <- data.frame(class, percent_2002, percent_2022)
multitemporal

# Visualizzare in formato tabella
View(multitemporal)


                                                     ## ANALISI MULTIVARIATA ##

### Non è presente nella presentazione, perchè il pc non è stato in grado di elaborare l'analisi multivariata ###

 ## PCA del 2002
ln2002_pca <- rasterPCA(ln2002)
ln2002_pca

# Summery è una funzione generica che riepiloga i risulati ottenuti con altre funzioni utilizzate
# Importance of components: quanto spiega della variabilità iniziale ogni singola componente
summary(ln2002_pca$model)

# Plot della mappa
plot(ln2002_pca$map)
    
# Standard deviation     
# Proportion of Variance    
# Cumulative Proportion     

pc1 <- ln2002_pca$map$PC1
pc2 <- ln2002_pca$map$PC2
pc3 <- ln2002_pca$map$PC3    

# Aprire un ggplot vuoto ed associare una geometria raster
g1_2002 <- ggplot() +
geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))

# x ed y rappresentano x e y della mappa, fill i nomi dei layer (PC1)

g2_2002 <- ggplot() +
geom_raster(pc2, mapping=aes(x=x, y=y, fill=PC2))

g3_2002 <- ggplot() +
geom_raster(pc3, mapping=aes(x=x, y=y, fill=PC3)) 

# Plot uno accanto all'altro g1_2002, g2_2002, g3_2002
g1_2002 + g2_2002 + g3_2002

# Deviazione standard sulla componente principale PC1
# Calcolare la variabilità sulla componente che ci da più informazioni, utilizzando la funzione focal
sd5_2002 <- focal(pc1, matrix(1/25, 5, 5), fun=sd)
sd5_2002

# Fare un mappaggio con ggplot della deviazione standard della componente principale 
ggplot() +
geom_raster(sd5_2002, mapping=aes(x=x, y=y, fill=layer))

# Visualizzare la mappa con la scala di colori inferno della funzione viridis
im_2002 <- ggplot() +
geom_raster(sd5_2002, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option= "inferno")
im_2002

# Falsi colori inserendo la banda 4 dell'infrarosso vicino g = 4
pRGB_2002 <- plotRGB(ln2002, 3, 4, 2, stretch="lin")

g1_2002 + im_2002 + pRGB_2002 

# pRGB_2002 è l'immagine originale con la la banda del NIR nella componente del green 
# g1_2002 è l'immagine della prima componente principale su cui è stata calcolata la deviazione standard 
# im_2002 è l'immagine con la devizione standard utilizzando la leggenda inferno della funzione viridis

 ## PCA del 2022, ha dato errore
ln2022_pca <- rasterPCA(ln2022)
ln2022_pca

# Summery è una funzione generica che riepiloga i risulati ottenuti con altre funzioni utilizzate
# Importance of components: quanto spiega della variabilità iniziale ogni singola componente
summary(ln2022_pca$model)

# Plot della mappa
plot(ln2022_pca$map)


pc1 <- ln2022_pca$map$PC1
pc2 <- ln2022_pca$map$PC2
pc3 <- ln2022_pca$map$PC3    

# Aprire un ggplot vuoto ed associare una geometria raster
g1_2022 <- ggplot() +
geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))

# x ed y rappresentano x e y della mappa, fill i nomi dei layer (PC1)

g2_2022 <- ggplot() +
geom_raster(pc2, mapping=aes(x=x, y=y, fill=PC2))

g3_2022 <- ggplot() +
geom_raster(pc3, mapping=aes(x=x, y=y, fill=PC3)) # molto rumore di fondo

# Plot uno accanto all'altro g1_2022, g2_2022, g3_2022
g1_2022 + g2_2022 + g3_2022

# Deviazione standard sulla componente principale PC1
# Calcolare la variabilità sulla componente che ci da più informazioni, utilizzando la funzione focal
sd5_2022 <- focal(pc1, matrix(1/25, 5, 5), fun=sd)
sd5_2022

# Fare un mappaggio con ggplot della deviazione standard della componente principale 
ggplot() +
geom_raster(sd5_2022, mapping=aes(x=x, y=y, fill=layer))

# Visualizzare la mappa con la scala di colori inferno della funzione viridis
im_2022 <- ggplot() +
geom_raster(sd5_2022, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option= "inferno")
im_2022

# Falsi colori inserendo la banda 5 del NIR, g = 5 
pRGB_2022 <- plotRGB(ln2022, 4, 5, 3, stretch="lin")

g1_2022 + im_2022 + pRGB_2022 

# pRGB_2022 è l'immagine originale con la la banda del NIR nella componente del green 
# g1_2022 è l'immagine della prima componente principale su cui è stata calcolata la deviazione standard 
# im_2022 è l'immagine con la devizione standard utilizzando la leggenda inferno della funzione viridis


