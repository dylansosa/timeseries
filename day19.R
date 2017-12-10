library(TSA)
court = ts(read.table('http://stat.slu.edu/~gong/Teaching/supremecourt.txt'))
gota = ts(read.table('http://stat.slu.edu/~gong/Teaching/gota.txt'))
eq = ts(read.table('http://stat.slu.edu/~gong/Teaching/earthquake.txt'),start = 1900)
acf(gota)
# looks like MA(1)
pacf(gota)
# checks if AR(2) or not 
arima(gota, order = c(0,0,1), method = 'CSS')
# least square estimator 
arima(gota, order = c(0,0,1), method = 'ML')
# maximum likelihood estimator method 

plot(eq)
# want to do some transformation
BoxCox.ar(eq)
# Prefer to choose some value that will make the model a little simple and pretty. 
# Looks like lambda could be 0.7, but not very beautiful 
# Of course cannot rule out zero lambda case. In this case we might choose thoe optimal value
# to maximize likelihood function. We choose MLE estimator value
# We choose lambda is 0.5
# Model would be:
# sqrt(Yt) - mu = phi(sqrt(Yt-1 - mu)) + et - theta1 + or - (depending on R theta sign.) et-1
plot(sqrt(eq))
# var is reduiced, cannot expect it is constant 
# assume stationary
# choose lambda is 0.5, but does not mean its the right one
acf(sqrt(eq))
# decays slowly, MA(5)
pacf(sqrt(eq))
# AR(2) 
res = armasubsets( y = eq, nar = 6, nma = 6, ar.method = 'ols')
# absed on bic.
# always choose minium bic score 
plot(res)
# chose phi is 6 and ma is 6 possible paramters 
# uuse ols to minimize score to select some subset 
# we got model, next thing is to identify parameters 
# suppose it is ARMA(1,1)
# identify unknown parameters 
arima(sqrt(eq), order = c(1,0,1), method = 'ML')
# ALWAYS MAXIMIZE LIKELIHOOD FUNCTION
# aic score 
# bic score 
# TSD is noisy and has a lot of uncertainty when building model 
# if use arma(1,1)
# if small data, use ML
# if more data, both methods should be ok