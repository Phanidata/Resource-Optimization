########################### Linear Regression #####################

y<-read.csv("C:\\Users\\BRAHMANANDAM\\Desktop\\Calls data\\Calls Data.csv")
summary(y)
head(y)

## Create the time series object
y <- ts(y, start = c(2017, 23), end = c(2019, 39), frequency = 53)
train <- ts(y[1:73])
test <- ts(y[74:123])

lin_Mod <- tslm(train ~ trend + season,
                data = train)
summary(lin_Mod)
plot(forecast(lin_Mod, h = 6))

x <- forecast(lin_Mod, h = 6)
x$fitted

## Model Accuracy
accuracy(x$fitted, y)
