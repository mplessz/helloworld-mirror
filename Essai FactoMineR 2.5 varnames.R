# Marie Plessz le 07/07/2021 (marie.plessz@inrae.fr)
# Essai de FactoMineR 2.5 : appeler les variables supplémentaires par leurs noms
# R version 4.0.3 (2020-10-10)


## pour mémoire pour installer le package à partir du zip :
# install.packages("C:/Users/user/Desktop/FactoMineR_2.5.tar/FactoMineR_2.5.tar", repos = NULL, type = "source")

## Charger et vérifier la version
library(FactoMineR)
packageVersion("FactoMineR")
# `2.5'`
data(tea)

## l'exemple de la doc
res.mca = MCA(tea, quanti.sup=19, quali.sup=c(20:36))
# fonctionne

## sans variable supplémentaire
res.mca = MCA(tea[,1:18])
# fonctionne

## avec la variable age, quanti supplémentaire, appelée par son nom
## j'essaie de différentes manières.

res.mca = MCA(tea[,1:19], quanti.sup=age)
#Error in MCA(tea[, 1:19], quanti.sup = age) : objet 'age' introuvable

res.mca = MCA(tea[,1:19], quanti.sup=tea$age)
#Error in `[.data.frame`(X, , quanti.sup, drop = FALSE) : undefined columns selected

res.mca = MCA(tea[,1:19], quanti.sup="age")
#Error in -nonact : argument incorrect pour un opérateur unitaire
 
res.mca = MCA(tea[,1:19], quanti.sup=c(age))
# Error in MCA(tea[, 1:19], quanti.sup = c(age)) : objet 'age' introuvable


## comment je fais actuellement
quantisup <- which(colnames(tea) %in% c("age"))
res.mca = MCA(tea[,1:19], quanti.sup=quantisup)
# fonctionne


## selon les consignes de Fran�ois Husson
quantisup <-  c("age")
qualisup <- c("SPC", "Sport", "age_Q")
res.mca = MCA(tea[,1:22], quanti.sup=quantisup, quali.sup = qualisup)

res.mca = MCA(tea[,1:22], quanti.sup=c("age"), quali.sup = c("SPC", "Sport", "age_Q"))
