population <- rnorm(n = 10000000, mean = 171, sd = 9)

mean(population)
sd(population)
#on retrouve les valeurs attendues

hist(population,main = "Répartition de la taille de la population")
#on retrouve un graphique ressemblant à une loi normale
x = subset(population, population > 190)
length(x)
#ou
sum(population > 190)
(1 - pnorm(q = 190, mean = 171, sd = 9)) * length(population)
#on retrouve les valeurs théoriques avec nos calculs
sum(population < 144)
pnorm(q = 144, mean = 171, sd = 9) * length(population)
#on retrouve les valeurs théoriques avec nos calculs

simul <- sample(population, size = 100, replace = TRUE)
mean(simul)
sd(simul)
#la moyenne et l'ecart type de l'echantillon se rapproche de celle de la population

mean(simul) - qnorm(0.975)* (sd(simul)/sqrt(100)) #borne < intervalle de fluctuation
mean(simul) + qnorm(0.975)* (sd(simul)/sqrt(100)) #borne > intervalle de fluctuation

df <-replicate(1000, simul)
moyenne <- apply(df, 1,mean)
ecart_type <- apply(replicate(1000,simul), 1,sd)
moyenne <- data.frame(moyenne)
ecart_type <- data.frame(ecart_type)
data <- cbind(moyenne,ecart_type)

hist(data$moyenne, main = "Distribution de la moyenne échantillonalle")
#on retrouve la forme d'une loi normale

mean(data$moyenne)
sd(data$moyenne)

sum(data$moyenne > 172.8)   #valeur simulée
(1 -pnorm(q = 172.8, mean = mean(data$moyenne), sd = sd(data$moyenne))) * 100#valeur théorique

mean(data$moyenne)-qnorm(0.975)*sd(data$moyenne)/sqrt(100)
mean(data$moyenne)+qnorm(0.975)*sd(data$moyenne)/sqrt(100)
