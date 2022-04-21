library(raster)
# install.packages('RStoolbox')
library(RStoolbox)

setwd("C:/lab/")

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc

# rosso = 1
# verde = 2
# blu = 3

plotRGB(gc, r=1, g=2, b=3, stretch="lin")

plotRGB(gc, r=1, g=2, b=3, stretch="hist")

gcclass2 <- unsuperClass(gc, nClasses=2)
