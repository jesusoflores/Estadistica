
#_____________Gráficos____________
# Matriz penguins, se encuentra en classroom

#--------------------------------------------
#  Importación de Matriz
#--------------------------------------------

#  import data / from excel / Browse / seleccionar archivo / aceptar

#--------------------------------------------
#       Exploración
#--------------------------------------------

dim(penguins)

#  Nombre de las variables
colnames(penguins)

# Tipo de variables
str(penguins)


# En busca de valores perdidos  (NA´s)
anyNA(penguins)

#   Estadística descriptiva
summary(penguins)

#--------------------------------------
#  Configuración de la matriz
#--------------------------------------

penguins$especie
#1.- Convertir las variables categóricas a factores
penguins$especie<-factor(penguins$especie,
                         levels=c("Adelie", "Gentoo", "Chinstrap" ))

penguins$isla
penguins$isla<-factor(penguins$isla,
                      levels = c("Torgersen", "Biscoe", "Dream"))


penguins$genero
penguins$genero<-factor(penguins$genero,
                        levels = c("male", "female"))

penguins$año
penguins$año<-factor(penguins$año,
                     levels=c("2007", "2008", "2009"))

str(penguins)

summary(penguins)

View(penguins)

penguins

#---------------------------------------
#        Librerias
#---------------------------------------
install.packages("ggplot2")

library(ggplot2)

#----------------------------------------
#           Boxplot
#----------------------------------------

# 1.- Creación de vector de colores
color=c("slateblue2", "springgreen3")

# 2.- Creación del gráfico

BX<-ggplot(penguins, aes(x=genero, y=largo_pico_mm))+
  geom_boxplot(fill=color)+
  ggtitle("Boxplot")+
  xlab("genero")+
  ylab("largo de la aleta (mm)")+
  theme_bw()

#3.- Vizualización del boxplot  
BX

#------------------------------------------------------------
#      Gráfico de barras
#------------------------------------------------------------

# 1.- Creación de un vector de color
color=c("palegreen1", "orangered3", "limegreen")

# 2.- Creación del gráfico
GB1<-ggplot(penguins, aes(x=año))+
  geom_bar(colour= "black", fill=color)+
  ggtitle("Gráfico de barras")+
  xlab("año")+
  ylab("Frecuencias")+
  theme_minimal()

#3.- Visualización de gráfico
GB1

#4.- Barras verticales

GB2<-ggplot(penguins, aes(x=año))+
  geom_bar(colour= "black", fill=color)+
  ggtitle("Gráfico de barras")+
  xlab("año")+
  ylab("Frecuencias")+
  coord_flip()+
  theme_minimal()
  
#5.- Visualización de gráfico
GB2

#---------------------------------------------
#       Histograma
#---------------------------------------------

#1.- Construcción del gráfico

HG<-ggplot(penguins, aes(x=largo_aleta_mm))+
  geom_histogram(colour= "black", fill="lightskyblue3")+
  ggtitle("Gráfico de barras")+
  xlab("largo de la aleta(mm)")+
  ylab("Frecuencias")+
  theme_classic()
#2.- Visualización del gráfico
HG

#----------------------------------------------
#               Gráfico de dispersión
#----------------------------------------------

#1.- Construcción del gráfico
GD<-ggplot(penguins, aes(x=largo_pico_mm, y=grosor_pico_mm))+
  geom_point(aes(color=especie))+
  ggtitle("Gráfico de dispersión")+
  xlab("largo del pico(mm)")+
  ylab("grosor del pico (mm)")+
  theme_light()

#2.- Visualización del objeto
GD


#----------------------------------------------
#              Organización de Gráficos
#----------------------------------------------

#1.- Descargar el paquete gridExtra

install.packages("gridExtra")

#Abrir libreria
library(gridExtra)

# 3.- Organización 2 gráficos en una fila y dos columnas
grid.arrange(BX,GB1,nrow=1,ncol=2)

# 4.- Organización 3 gráficos en dos filas y dos columnas
grid.arrange(BX,GB1,HG,nrow=2,ncol=2)

#4.- Organización 4 gráficos en dos filas y dos columnas
grid.arrange(BX,GB1,HG,GD,nrow=2,ncol=2)
