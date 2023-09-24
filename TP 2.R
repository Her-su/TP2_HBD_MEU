
# Trabajo Practico n° 2 

## Librerias: 

library(tidyverse)

library(haven) 

## Se importa dateframe desde sitio : datos.gob.ar 

empresas_distribuidoras_EE <- read.csv("http://datos.energia.gob.ar/dataset/7b3dccac-d1b5-4708-81d1-e909a01aa0ec/resource/0b901267-ad62-417b-a48f-54c0d553d45c/download/empresas-y-cooperativas-distribuidoras-de-energa-elctrica.csv")

## Se instala janitor para limpiar nombres de columnas del dataset mediante clean names (aunque en este caso no resultó necesario) 

install.packages("janitor")
library(janitor)

empresas_distribuidoras_EE_limpia <- empresas_distribuidoras_EE %>% 
  clean_names()

head(empresas_distribuidoras_EE)

## (a) 1era capa Visualización estándar de ggplot2:

ggplot(data =empresas_distribuidoras_EE, mapping = aes(x = tipo_emp, y = provincia))

## (a) 2da capa Visualización estándar con geom de ggplot2:

ggplot(data =empresas_distribuidoras_EE, mapping = aes(x = tipo_emp, y = provincia)) +
  geom_point()


## Se añade color a geom point segun categoria (tipo de empresa) "mapeando": 

ggplot(data =empresas_distribuidoras_EE, mapping = aes(x = tipo_emp, y = provincia)) +
geom_point(aes(color = tipo_emp)) 

## Aqui se "setea" el color de los puntos:

ggplot(data =empresas_distribuidoras_EE, 
         mapping = aes(x = tipo_emp, y = provincia)) +
         geom_point(aes(color = tipo_emp), 
                    color = "purple") 

## Aqui se añade geometrias a los puntos:

ggplot(data =empresas_distribuidoras_EE, 
       mapping = aes(x = tipo_emp, y = provincia)) +
       geom_point(aes(color = tipo_emp, 
                  shape = tipo_emp), 
                  color = "purple") 


## Prueba de facet en 3:   

ggplot(data =empresas_distribuidoras_EE, mapping = aes(x = tipo_emp, y = provincia)) +
  geom_point() + facet_wrap(~ tipo_emp, nrow = 3)

## Prueba de facet en 3 para visualizar los tipos de empresa a nivel nacional por provincia y departamento: 

ggplot(data =empresas_distribuidoras_EE, mapping = aes(x = depto, y = provincia)) +
  geom_point(aes(color = tipo_emp, 
                 shape = tipo_emp)) 
   + facet_wrap(~ tipo_emp, nrow = 3)

## prueba con filtro y añadiendo etiquetas y customizado con theme (codigo mas ordenado por terminos): 

http://127.0.0.1:9095/graphics/plot_zoom_png?width=1920&height=1017
ggplot(data =empresas_distribuidoras_EE, mapping = aes(x = tipo_emp, y = provincia)) +
  geom_point() + 
  geom_point(data =empresas_distribuidoras_EE %>% 
  filter(provincia == "Buenos Aires" ), colour = "red" , size = 3) + 
  labs(title = "Empresas distribuidoras de energia en Argentina", subtitle = "Por tipo:", y = "Provincias", x = "Tipos de empresa") +
   theme(title = element_text(colour = "blue"))


ggplot(data =empresas_distribuidoras_EE, 
       mapping = aes(x = tipo_emp, y = provincia)) +
  geom_point(aes(color = tipo_emp, 
                 shape = tipo_emp), 
             color = "purple" , size = 3) + 
  labs(title = "Empresas distribuidoras de energia en Argentina", subtitle = "Por tipo:", y = "Provincias", x = "Tipos de empresa") +
  theme(title = element_text(colour = "blue"))



## Pruebas con geoAr: 

library(geoAr)

show(empresas_distribuidoras_EE_limpia)

class(empresas_distribuidoras_EE_limpia)


## Se instala paquetes sf y leaflet:

install.packages("sf")

install.packages("leaflet")

library(sf)
library(leaflet)

## Se crea el objeto Mdza a partir de la libreria geoAr y se genera una visualización del mapa de la provincia con ajuste de definición  

geoAr::show_arg_codes(viewer = T)
Mdza <- get_geo(geo = "MENDOZA", simplified = FALSE) %>% 
plot(Mdza) 
class(Mdza) 

