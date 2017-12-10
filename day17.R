huron = ts(read.table('http://stat.slu.edu/~gong/Teaching/huron.txt'), start = 1880)
plot(huron)
acf(huron)
# AR not non-stationary 
pacf(huron)
# To find order of AR process. Only one spike. LIkely AR(1)
# Cannot rule out AR(2). Likey to be AR(1)
# Cannot be greater than two. 
# Want to identify value of phi
mean(huron)
# Not 0
# When build AR(1) assume mean is 0. This means 

acf(huron, plot = FALSE)
# Output values, not plot 

ar(huron, order.max = 1, method = 'yw', AIC = F)
# Method of Moments
# Autoregressive fxn. Put data and order (assuming it is AR(1)) method is Method of Moments
# output coefficient
ar(huron, order.max = 2, method = 'yw', AIC = F)

# given some data do acf to find if stationary
# find if AR or not
# determine order of AR using pacf
# if order 1 or 2 then use mom to identify coefficients then build model 
# not good for MA 
# It is difficult ot get rhok for MA and cant use yule walker
# using MoM on MA wont get invertible process 
arima(huron, order = c(2,0,0), method = 'CSS')
# coefficients are .84
# using MoM from line 17 is similar to this result 
