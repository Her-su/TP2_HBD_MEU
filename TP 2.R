
# Trabajo Practico n° 2 

## Librerias: 

library(tidyverse)

library(haven) 

## Se importa dateframe desde sitio : datos.gob.ar 

empresas_distribuidoras_EE <- read.csv("http://datos.energia.gob.ar/dataset/7b3dccac-d1b5-4708-81d1-e909a01aa0ec/resource/0b901267-ad62-417b-a48f-54c0d553d45c/download/empresas-y-cooperativas-distribuidoras-de-energa-elctrica.csv")

## Se instala janitor para limpiar nombres de columnas (aunque en este cao no fuera necesario) 

install.packages("janitor")
library(janitor)

empresas_distribuidoras_EE_limpia <- empresas_distribuidoras_EE %>% 
  clean_names()

