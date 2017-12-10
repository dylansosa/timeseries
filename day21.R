huron = ts(read.table('http://stat.slu.edu/~gong/Teaching/huron.txt'),start = 1880)
length(huron)
head(huron)
huron
# suppose want to predict using forecasting
# build a model ,AR, MA, ARMA
acf(huron)
# can't be MA
pacf(huron)
# AR(1)
huron.fit = (arima(huron, order = c(1,0,0), method = 'ML'))
huron.fit
# gives phi and mu value 
# use this to build model an make predictions 
huron.predict = predict(huron.fit, n.ahead = 20)
# contains all prediction values and also standard deviation
huron.predict
# $pred is Yt(l)Hat
# $se is used to build confidence interval 

# buid 95% confidence interval 
lower1 = huron.predict$pred - qnorm(0.975)*huron.predict$se # makes alpha equal to 0.025
upper1 = huron.predict$pred + qnorm(0.975)*huron.predict$se
lower1
upper1
# lower and upper level estimation
# can change alpha if u want 
data.frame(year=c(2007:2026), lower1, upper1)
# combined upper and lower bounds 
plot(huron.predict$pred, n.ahead = 20, col = 'red', type = 'b', n1 = 1940)
