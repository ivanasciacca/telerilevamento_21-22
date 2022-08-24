# Codice R per modelli di distribuzione di specie 

# Installare il pacchetto sdm
install.pachages("sdm")

# Richiamare le librerie da utilizzare
library(raster)
library(rgdal)
library(sdm)

# La funzione system.file serve a caricare un file in R e specifica da quale pacchetto viene preso 
file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file) 
species 

# Plot dei punti nello spozio che occupa questa specie 
plot(species)

# Occurrence presenza (1) o assenza (0) della specie in questa area 
species$Occurrence

# Mappare solo le presenze della specie in blu 
occ <- species$Occurrence
plot(species[occ == 1,],col='blue',pch=19)

# Mappare le assenze della specie in rosso 
points(species[occ == 0,],col='red',pch=19)

# Predittori (mappe che riguardano fattori climatici e ambientali, che determinano la distribuzione di una specie)
path <- system.file("external", package="sdm")

# Lista dei predittori
lst <- list.files(path=path,pattern='asc',full.names = T)
lst

# La funzione stack importa le 4 variabili ambientali (raster)
preds <- stack(lst)

# Plot dei predittori
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# Plot dei predittori associati alla presenza della specie 
elev <- preds$elevation
prec <- preds$precipitation
temp <- preds$temperature
vege <- preds$vegetation

plot(elev, col=cl)
points(species[occ == 1, ], pch=19)

plot(temp, col=cl)
points(species[occ == 1, ], pch=19)

plot(prec, col=cl)
points(species[occ == 1, ], pch=19)

plot(vege, col=cl)
points(species[occ == 1, ], pch=19)

# La specie è localizzata verso le quote più basse, in aree ricche di vegetazione, con temperature medio-alte e molte precipitazione


# La funzione sdmDate che crea un oggetto con tutti i dati, train (dati a terra, in questo caso la specie) e predictors (i predittori)
datasdm <- sdmData(train=species, predictors=preds)
datasdm

# Creare il modello lineare generalizzato
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")
m1

# Mappa di previsione della presenza della specie 
p1 <- predict(m1, newdata=preds) 
p1

# Plot della mappa di previsione della specie con la distribuzione della specie originale (points)
plot(p1, col=cl)
points(species[occ == 1,], pch=19)

# I punti neri sono i punti originali della presenza della specie, la previsione è più alta, tranne in corrispondenza del blu dove la previsione è bassa.

# Plot dei predittori e della mappa di previsione, costruendo un par mfrow in 2 righe e 3 colonne
par(mfrow=c(2,3))
plot(p1, col=cl)
plot(elev, col=cl)
plot(prec, col=cl)
plot(temp, col=cl)
plot(vege, col=cl)

# Metodo alternativo tramite l'uso della funzione stack
final <- stack(preds, p1)
plot(final, col=cl)
