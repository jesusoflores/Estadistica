
#_________ Tablas de frecuencia_________
# Utilizamos la matriz iris

#-------------------------------------------
#    Exploracion de la matriz
#-------------------------------------------

#1.-     Exportación de matriz
data(iris)

#2.-     Exploración de la matriz
# Tenemos 150 individuos y 5 variables
dim(iris)

#3.- Nombre de las columnas
colnames(iris)

#4.- Exploración de especies
iris$Species

#5.- Tipos de variables
str(iris)

#6.- En busca de valores perdidos
anyNA(iris)

#--------------------------------------
# Generación de tablas NO AGRUPADAS
#--------------------------------------

#1.-  Convertir la matriz de datos a un data frame,
# se agrupan los valores para la variable Petal.Length
# y se calcula la frecuencia absoluta

tabla_Pl<-as.data.frame(table(Pl=iris$Petal.Length))

# Visualización de la tabla de contingencia de 
# La variable Petal.Length(Pl)  y su respectiva frecuencia
# absolura
tabla_Pl

# 3.- Crear la tabla completa
tabla1<-transform(tabla_Pl,
          freqAc=cumsum(Freq),
          Rel=round(prop.table(Freq),3),
          RelAc=round(cumsum(prop.table(Freq)),3))

#------------------------------------
#    Tablas agrupadas
#------------------------------------
# Nota: Se debe tener previamente el calculo
# de la amplitud y Rango

#1.- Agrupación de la variable en clases (8 clases)
# 8 renglones
tabla_clases<-as.data.frame(table(Petal.Length=factor(cut(iris$Petal.Length,
                               breaks=8))))

tabla_clases

# 2.- Construcción la tabla completa

tabla2<-transform(tabla_clases,
                  freqAc=cumsum(Freq),
                  Rel=round(prop.table(Freq),3),
                  RelAc=round(cumsum(prop.table(Freq)),3))
tabla2
