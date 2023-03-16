
############################################
#                                          #
# LABORATORIO DE EDICIÓN DE COLOR-PARTE 2  #
#                                          #
############################################


# Hecho con gusto por JESSICA PAOLA AGUILAR SERVIN
# V8
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Editando el color de los gráficos (PARTE 1)

#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")



# cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)

# cargando datos a entorno
data("gapminder")

# filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]

# de donde sacar colores?
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# escala discreta
# haciendo grafica de puntos por continente
g1 <- ggplot(data = gapminder2007,
             mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           color = continent)) +
  geom_point()

#ver g1
g1

# haciendo boxplot en continentes
g2 <- ggplot(data = gapminder2007,
             mapping = aes(x = continent, 
                           y = lifeExp,
                           fill = continent)) +
  geom_boxplot()

#ver g2
g2


# cambiando el color de los continentes

g1 + scale_color_manual (values = c('cadetblue',
                                               'chartreuse',
                                               'firebrick',
                                               'gold',
                                               'darkorchid'))
                                               
g2 + scale_fill_manual (values = c('cadetblue',
                                              'chartreuse',
                                              'firebrick',
                                              'gold',
                                              'darkorchid'))
                                              

# cambiando colores con paleta RColorBrewer
# instalar RColorBrewer
install.packages('RColorBrewer')
# para ver las paletas

library(RColorBrewer)
display.brewer.all()
# guardar como imagen width = 400, height = 800

# cambiando escala de color
g1 + scale_color_brewer(palette="BrBG")

g2 + scale_fill_brewer(palette="Paired")

# cambiando escala de grises

g1 + scale_color_grey()

g2 + scale_fill_grey()


########### PARTE 2  ###############


# Escala continua (variable continua)
# haciendo grafica de puntos por poblacion
g3 <- ggplot(data = gapminder2007,
             mapping = aes(x = gdpPercap, 
                           y = lifeExp,
                           color = log(pop))) +
  geom_point()

# Ver g3
g3

# cambiando el color de los puntos según gradiente
g3 + scale_color_gradient(low="blue", high = "red")

# cambiando el color de los puntos según gradiente asignar punto medio
g3 + scale_color_gradient2(midpoint = 16,
                           low="blue",
                           mid = "white", 
                           high = "red", 
                           space="Lab" )

# haciendo histograma en poblacion
g4 <- ggplot(data = gapminder2007,
             mapping = aes(x = lifeExp,
                           fill = ..count..)) +
  geom_histogram()

# Ver g4
g4

# cambiando color de barras histograma
g4 + scale_fill_gradient(low="blue", high = "red")
