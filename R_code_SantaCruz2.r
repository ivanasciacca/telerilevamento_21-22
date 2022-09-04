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

lst02_1 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B1.tif")
lst02_1

lst02_2 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B2.tif")
lst02_2

lst02_3 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B3.tif")
lst02_3

lst02_4 <- raster("LC09_L2SP_230072_20220814_20220816_02_T1_SR_B4.tif")
lst02_4

# Importare i dati tutti insieme, tramite la funzione list.fils che crea una lista di file
# patter = ciò che hanno in comune questi file, in questo caso è lst

rlist02 <- list.files(pattern="lst02")
rlist02

# Applicare la funzione raster all'intera lista, importare i 4 file
import <- lapply(rlist02, raster)
import

# La funzione stack ci consente di mettere insieme tutti i file in un blocco comune
tgr <- stack(import)
tgr
