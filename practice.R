install.packages("caret")
install.packages("kernlab")
library(caret)
library(kernlab)

data(spam)
inTrain <- createDataPartition(y= spam$type , p=0.75, list = FALSE)

training <- spam[inTrain,]
testing<- spam[-inTrain,]

mmodelFit<- tra

install.packages("AppliedPredictiveModeling")
install.packages("rattle")
library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(rpart)
inTrain <- createDataPartition(y= segmentationOriginal$Case , p=0.75, list = FALSE)

training <- segmentationOriginal[inTrain,]
testing<- segmentationOriginal[-inTrain,]

set.seed(125)

modFit <- train(Class ~ ., method = "rpart", data = training)
modFit
modFit$finalModel

library(rpart.plot)
library(rattle)
fancyRpartPlot(modFit$finalModel)

install.packages("pgmm")
library(pgmm)
data(olive)
olive = olive[,-1]

modolive <- train(Area ~ ., method = "rpart", data = olive)
newdata = as.data.frame(t(colMeans(olive)))
predict(modolive, newdata = newdata)

install.packages("ElemStatLearn")
library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

library(caret)
install.packages("gbm")
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis, predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[inTrain, ]
testing = adData[-inTrain, ]

set.seed(62433)
model_rf <- train(diagnosis~., data = training, method = "rf")
model_gbm <- train(diagnosis ~ ., data = training, method = "gbm")
model_lda <- train(diagnosis ~ ., data = training, method = "lda")

pred_rf <- predict(model_rf, testing)
pred_gbm <- predict(model_gbm, testing)
pred_lda <- predict(model_lda, testing)
predDF <- data.frame(pred_rf, pred_gbm, pred_lda, diagnosis = testing$diagnosis)
combModFit <- train(diagnosis ~ ., method = "rf", data = predDF)
combPred <- predict(combModFit, predDF)
