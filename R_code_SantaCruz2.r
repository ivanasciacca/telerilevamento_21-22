# Richiamare le librerie 
library(raster)


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
# B1 = banda del blu
# B2 = banda del verde
# B3 = banda del rosso
# B4 = banda de NIR

B1_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B1.tif")
B1_2014

B2_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B2.tif")
B2_2014

B3_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B3.tif")
B3_2014

B4_2014 <- raster("LC08_L2SP_230072_20141019_20200910_02_T1_SR_B4.tif")
B4_2014

# Importare i dati tutti insieme, tramite la funzione list che crea una lista di file
rlist14 <- list(B1_2014, B2_2014, B3_2014, B4_2014)

# La funzione stack ci consente di mettere insieme tutti i file in un blocco comune
# Con la funzione plot, visualizziamo l'immagine
ln2014 <- stack(rlist14)
ln2014
plot(ln2014)

# Con la funzione plotRGB è possibile visualizzare l'immagine a colori naturali, r = 3, g = 2, b = 1 
plotRGB(ln2014, 3, 2, 1, stretch="lin")

# Salvare l'immagine in RGB con la funzione jpeg
jpeg("ln2014.jpeg")
plotRGB(ln2014, 3, 2, 1, stretch="lin")
dev.off()


   ## 2022 ##

# Caricare i RasterLayer delle singole bande del 2022
# B1 = banda del blu
# B2 = banda del verde
# B3 = banda del rosso
# B4 = banda de NIR

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

# Calcolare il DVI del 2002 e plottare l'immagine utilizzando una colorRampPalette
dviln2002 = ln2002[[4]] - ln2002[[3]]
dviln2002

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2002, col=cl)

# Salvare l'immagine del dviln2002 con la funzione jpeg
jpeg("dviln2002.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2002, col=cl)
dev.off()

# Calcolare il DVI del 2014 e plottare l'immagine utilizzando una colorRampPalette
dviln2014 = ln2014[[4]] - ln2014[[3]]
dviln2014

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2014, col=cl)

# Salvare l'immagine del dviln2014 con la funzione jpeg
jpeg("dviln2014.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2014, col=cl)
dev.off()

# Calcolare il DVI del 2022 e plottare l'immagine utilizzando una colorRampPalette
dviln2022 = ln2022[[4]] - ln2022[[3]]
dviln2022

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2022, col=cl)

# Salvare l'immagine del dviln2022 con la funzione jpeg
jpeg("dviln2022.jpeg")
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dviln2022, col=cl)
dev.off()


# Calcolare la differenza di DVI nell'ultimo ventennio 2002 - 2022
## I due DVI hanno estenzione diverse, quindi bisogna adattare l'estenzione del dvi22 basandoci su quella del dvi02 grazie alla funzione resample 
dviln2022r = resample(dviln2022, dviln2002)
dvi_dif = dviln2002 - dviln2022r
dvi_dif

# Plottare e salvare in jpeg, la differenza di DVI dal 2002 al 2022 con una leggenda costruita con la dunzione colorRampPalette
jpeg("dvi_dif.jpeg")
cld <- colorRampPalette(c('blue','white','magenta'))(100)
plot(dvi_dif, col=cld)
dev.off()


# Calcolare e plottare NDVI del 2002
ndviln2002 = dviln2002 / ln2002[[4]] + ln2002[[3]]
ndviln2002

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndviln2002, col=cl)

# Calcolare e plottare NDVI del 2014
ndviln2014 = dviln2014 / ln2014[[4]] + ln2014[[3]]
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
