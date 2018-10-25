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

# filtrar por más de un criterio

gapminder %>% 
  filter(year == 2007, continent == "Americas")

# reordenar

gapminder %>% 
  filter(year == 2007, continent == "Americas") %>% 
  arrange(lifeExp)

# resumir

gapminder %>% 
  filter(year == 2007) %>% 
  summarise(mean(lifeExp))
  
# agrupar

gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(mean(lifeExp)) %>% 
  write_csv("expectativa_vida.csv")

# cargar el archivo

exp_vida <- read_csv("expectativa_vida.csv")

# un último gráfico

ggplot(gapminder) + aes(gdpPercap, lifeExp) + geom_point(color = "#fca2cf", alpha = 0.3) + scale_x_log10() + geom_smooth(method = "lm", color = "#ffaf0a") + labs(x = "PIB per cápita", y = "Expectativa d evida", title = "Relación entre expectativa de vida y PIB per cápita", subtitle = "Los puntos en el gráfico representan a los países por año", caption = "Fuente: Gapminder")


# Importar CSV desde internet

unibaja <- read_csv("https://raw.githubusercontent.com/rivaquiroga/taller-R-chicas-poderosas/master/mujeres_camara_unibaja.csv")

alta <- read_csv("https://raw.githubusercontent.com/rivaquiroga/taller-R-chicas-poderosas/master/mujeres_camara_alta.csv")


unibaja %>% 
  filter(pais %in% c("Chile", "Bolivia", "Brazil", "Argentina")) %>% 
  ggplot() + aes(pais, porcentaje_mujeres_unibaja) + geom_col() + expand_limits(y = 100)

mujeres_parlamento <- left_join(unibaja, alta)
doble_camara <- inner_join(unibaja, alta)

View(mujeres_parlamento)
View(doble_camara)




