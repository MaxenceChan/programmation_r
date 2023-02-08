library("readxl")
setwd("C:/Users/elect/OneDrive/Bureau/STID/Cours/Semestre 2/Programmation statistique/TP2")
data <- read_excel(path="pokemon.xlsx",sheet = "pokemon")

dim(data) # affiche les dimensions du tableau de données
colnames(data) #affiche le nom des colonnes
str(data) #affiche le type des colonnes
data$generation <- as.factor(data$generation) #affectation du type "factor"
data$is_legendary <- as.factor(data$is_legendary) #affectation du type "factor"
data$type <- as.factor(data$type) #affectation du type "factor"
length(levels(data$generation)) #Compte le nombre de modalités
length(levels(data$is_legendary)) #Compte le nombre de modalités
length(levels(data$type)) #Compte le nombre de modalités
summary(data) #résumer des données 

mean(data$weight_kg, na.rm = T) #affiche la moyenne
median(data$weight_kg, na.rm = T) #affiche la médiane
quantile(data$height_m,na.rm = T) #affiche les quartiles
quantile(data$height_m,na.rm = T,probs = seq(0,1,0.1)) #affiche les déciles
var(data$weight_kg,na.rm = T) #affiche la variance de weight_kg
sd(data$weight_kg,na.rm = T) #affiche l'écart-tyoe de weight_kg


#Déterminer un tri à plat pour compter les effectifs des modalités 
#de chaque variable factor en triant chaque sortie par ordre décroissant

sort(table(data$generation),decreasing = T) 
sort(table(data$is_legendary), decreasing = T)
sort(table(data$type),decreasing = T)

#Sélectionnez la colonne nom et is_legendary.

data$nom
data$is_legendary

#Sélectionnez les 50 premières lignes et les deux premières colonnes
head(data[1:2],50)

#Sélectionnez les 10 premières lignes et toutes les colonnes.
head(data,10)

#Sélectionnez toutes les colonnes sauf la dernière.
data[-10]

#Triez le dataset par ordre alphabétique et 
#afficher le nom du pokemon dela première ligne

head(data[order(data$nom),][2],1)

#Triez le dataset par weight_kg en ordre décroissant, 
#et afficher le nom du pokemon de la première ligne

head(data[order(data$weight_kg),][2],1)

#Triez le dataset par attack en ordre décroissant 
#puis par speed en ordre croissant, et afficher le
#nom des pokemons des 10 premières lignes.

head(data[order(-data$attack,data$speed),],10)

#Filtrez sur les pokemons qui ont 150 ou plus d’attack puis trier 
#le résultat par ordre décroissant d’attack.

a <- subset(data,data$attack >= 150)
a[order(-a$attack),]

#Filtrez sur les pokemons de type dragon,ghost,psychic et dark
subset(data, data$type %in%c("dragon","ghost","psychic","dark"))

#Filtrez sur les pokemons de type fire avec plus de 100 d’attack, 
#puis trier le résultat par ordre décroissant d’attack

b <- subset(data, data$type %in%c("fire"))
subset(b, b$attack >100)

#Filtrez sur les pokemons qui ont entre 100 et 150 de speed. 
#Les trier par speed décroissant

c <- subset(data, data$speed %in%c(100:150))
c[order(-c$speed),]

#Filtrez sur les pokémons qui ont des valeurs manquantes sur la 
#variable height_m.

subset(data, data$height_m %in%c(NA))

#Filtrez sur les pokemons qui ont des valeurs renseignées à la fois 
#pour la variable weight_kg et la variable height.

h <- subset(data, data$height_m %in%c(NA))
h <- subset(h, h$weight_kg %in%c(NA))
h

#Filtrez sur les pokemons pesant plus de 250 kg et affichez 
#le résultat pour vérifier.

subset(data, data$weight_kg > 250)
