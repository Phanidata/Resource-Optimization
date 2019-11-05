install.packages("fpp")
install.packages("forecast")
install.packages("TTR")
library(forecast)
library(fpp)
library("TTR")
y<-read.csv("C:\\Users\\BRAHMANANDAM\\Desktop\\Calls data\\Calls Data.csv")
summary(y)
plot(y)
head(y)

y <- ts(y, start = c(2017, 23), end = c(2019, 39), frequency = 53)
plot(y)

model<-auto.arima(y, trace= TRUE, ic ="aic")
head(y)
finalmodel = arima(y, order = c(4,1,0))
summary(finalmodel)

forecast(finalmodel,h=6)

Decom <- decompose(y)
plot(decompose(y))

## Removing Seasonality
DeSeasonal_y <- y - Decom$seasonal
plot(DeSeasonal_y)

model<-auto.arima(DeSeasonal_y, trace= TRUE, ic ="aic")
head(DeSeasonal_y)
finalmodel = arima(DeSeasonal_y, order = c(4,1,0))
summary(finalmodel)

fitted(finalmodel)
forecast(finalmodel,h=6)

plot(forecast(finalmodel,h=6))