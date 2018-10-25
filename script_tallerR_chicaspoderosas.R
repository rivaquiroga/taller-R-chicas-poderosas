# Taller de Introducción a R | Chicas Poderosas: nuevos medios, nuevas voces
# Jueves 25 de octubre de 2018 | 11:30 - 13:30
# Riva Quiroga | RLadies Santiago | @rivaquiroga | riva@rladies.org

### SCRIPT TALLER ###

#install.packages("tidyverse")

# cargar los paquetes
library(tidyverse)
library(gapminder)

View(gapminder) # para mirar la tabla completa
head(gapminder) # imprimir en la consola las 6 primeras líneas
tail(gapminder) # imprimir las seis últimas
str(gapminder) # estructura de los datos
names(gapminder)

gapminder %>%
  filter(country %in% c("Argentina", "Chile", "Uruguay", "Peru"))

paises <- gapminder %>%
  filter(country %in% c("Argentina", "Chile", "Uruguay", "Peru"))

ggplot(paises) + aes(x = year, y = gdpPercap, color = country) + geom_line()




