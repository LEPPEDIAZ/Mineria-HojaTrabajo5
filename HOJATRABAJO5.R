library(e1071)
library(caret)
perros5 <- read.csv("train.csv")
porcentaje<-0.7
datos<-perros5
prueba <- perros5[,3:15]
prueba[14] <- perros5[24]


datos<-prueba
set.seed(123)

corte <- sample(nrow(datos),nrow(datos)*porcentaje)
train<-datos[corte,]
test<-datos[-corte,]

modelo<-naiveBayes(as.factor(AdoptionSpeed)~Sterilized + Age,data=train)

predBayes<-predict(modelo, newdata = test[,1:13])
table(predBayes,test$AdoptionSpeed)
confusionMatrix(as.factor(predBayes),as.factor(test$AdoptionSpeed))
