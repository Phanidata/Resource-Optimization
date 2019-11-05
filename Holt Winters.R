##################### Holt Winter's Method #################

library(forecast)
library(fpp)
library("TTR")
y<-read.csv("C:\\Users\\BRAHMANANDAM\\Desktop\\Calls data\\Calls Data.csv")
summary(y)
plot(y)
head(y)

## Create the time series object
y <- ts(y, start = c(2017, 23), end = c(2019, 39), frequency = 53)
plot(y)
class(y)

## Perform Holt-Winters exponential smoothing
y.hw <- HoltWinters(y)
y.hw
plot(y.hw,
     col = "black",
     col.predicted = "blue")

## checking the model parameters
y.hw$model

forecast(y.hw, h = 6)

## Model Accuracy
accuracy(y.hw$fitted, y)

write.csv(y.hw$fitted, "C:\\Users\\BRAHMANANDAM\\Desktop\\Calls data\\holt1.csv")