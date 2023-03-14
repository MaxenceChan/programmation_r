data <- read.csv("NBA.csv", sep = ",", dec = ".")
ncol(data)
nrow(data)
summary(data)
data$PERIOD = as.factor(data$PERIOD)
data$PTS_TYPE = as.factor(data$PTS_TYPE)
summary(data)
quantile(data$CLOSE_DEF_DIST, probs = seq(0,1,0.1), na.rm = FALSE)
length(unique(data$GAME_ID))
length(unique(data$SHOOTER))
data$SHOT_DIST_METRE = 0.3 * data$SHOT_DIST
barplot(table(data$PERIOD),main = "Répartition des tirs par période",
        xlab = "Période", ylab = "Nombre de tirs")


a <- table(data$SHOT_RESULT) / length(data$SHOT_RESULT)
a <- round(a,2)
ma_palette <- c( vert = "#2FB846", 
                 bleu = rgb(red = 4/255,green = 12/255 ,blue = 250/255 , alpha = 0.5))
pie(a, main =
      "Répartition du résultat des shoots", 
   labels = paste(rownames(a),a), col = ma_palette[1:2], 
   )

legend(x = "bottomright", legend=rownames(a), pch = 19 ,cex=0.8, col = ma_palette[1:2])

hist(data$SHOT_DIST_METRE, main = "Distribution de la distance des shoots", col = "red", 
     xlab = "Distance du shoot en mètre", ylab = "Effectif")
filtre_pts <- subset(data, data$PTS_TYPE %in% c(2,3))

barplot(table(filtre_pts$PTS_TYPE,filtre_pts$PERIOD) / length(filtre_pts$PTS_TYPE), main = "Répartition de tirs à 2-3
        points pour chaque période", xlab = "Période", ylab = "Fréquence", col = ma_palette[1:2])
legend(x = "topright", legend = data$PTS_TYPE, pch = 19, cex = 0.8, col = ma_palette[1:2])

boxplot(data$SHOT_DIST_METRE, main = "Distribution de la distance de shoot")
boxplot(data$SHOT_DIST_METRE ~ data$PERIOD, main = "Distribution de la distance de shoot par période")
