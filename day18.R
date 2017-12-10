gota = ts(read.table('http://stat.slu.edu/~gong/Teaching/gota.txt'))
library(TSA)
plot(gota,type='o')
# river gota 
# discharge rate 
acf(gota)
# check if stationary or not 
# Looks like MA(1)
pacf(gota)
# Two spikes 
# Indicates it might be AR(2)
# MA(1) is a good candidate 
eacf(gota)
# not very good, looks like AR(1)
mean(gota)
# This is mu
arima(gota, order = c(0,0,1), method = 'CSS')
# use ar function to calculate coefficients with MoM
# use ma to get theta 1 
# it is ma1j
# intercept is mean 
# CSS 
# assume is AR(2), p = 2
arima(gota, order = c(2,0,0), method = 'CSS')
# gives phi 1 and 2 and mean

# if is order one process, MA(1) then use the mean produced from the function that assumed MA(1)
# Y_t = e_t + 0.53e_t-1 + 534
# always use opposite sign for theta values in R code

# for AR(2)
# Y_t - 537 = 0.5783*(Y_t - 537) - 0.269*(Y_t-2 - 537) + e_t model to generate stationary data 
# cannot rule out MA(1) or AR(2)
# both possible for this data 

cows = ts(read.table('http://stat.slu.edu/~gong/Teaching/cows.txt'))
# cow glucose level 
acf(cows)
# seems like MA 4 or 5 
pacf(cows)
# pacf checks AR
# seems like AR(3)
eacf(cows)
# only if both acf and pacf give terrible results, use eacf to make guess 
out = armasubsets(y=cows, nar=4,nma=5,ar.method='ols')
plot(out)
# predicts MA(2)
# means it predicts ARMA(1,2)
# means it could be a mixed model 
# only order one or two could be significant 
# assume is arma(1,1)
# have theta and phi 
# phi is ar, theta is ma 
arima(cows, order=c(1,0,1), method = 'CSS')
mean(cows)
# always wnat to build model as simple as possible
# select high order for AR, MA is typically lower 
arima(cows, order=c(1,0,2), method = 'CSS')
# ma2 is 0.02, very small contribution 
# ignore higher order MA

arima(cows, order=c(1,0,0), method = 'CSS')

# we have another estiomre, called maximum likelihood estimator 
# always need to set e_0 = 0
# sometimes it may not be true 
# MLE

