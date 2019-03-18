library(e1071)
library(caret)
perros5 <- read.csv("train.csv")
porcentaje<-0.7
datos<-perros5
set.seed(123)

corte <- sample(nrow(datos),nrow(datos)*porcentaje)
train<-datos[corte,]
test<-datos[-corte,]

modelo<-naiveBayes(AdoptionSpeed~.,data=train)

predBayes<-predict(modelo, newdata = test)
confusionMatrix(as.factor(predBayes),as.factor(test$AdoptionSpeed))


