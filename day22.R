cows = ts(read.table('http://stat.slu.edu/~gong/Teaching/cows.txt'))
plot(cows)
cows.fit = arima(cows, order = c(1,0,1),method = 'ML')
cows.fit
# get phi and theta value and mean
# can use this model 
# ARMA(1,1)
# phi is 0.66
# etha is -0.61
# use this to predict future 
cows.predict = predict(cows.fit, n.ahead = 10)
cows.predict
# inside is a model
# contains the coefficiens value 
# has the theta and phi, predicts 10 time points ahead value
# if you give predict it gives predicted values 
# usign standard error, can make confidence interval 

# building 95% confidence interval 
# alpha is 5%, alpha/2 is 2.5%
# both tail = 2.5%
# use 1nor to calculate z-value = 2.5%
# will be negative value use mean + z * standard error
# if you want positie value, use qnrom(97.5%) give positive 
# lower bound is minus ^ * standard error
lower = cows.predict$pred + qnorm(0.025) * cows.predict$se
upper = cows.predict$pred - qnorm(0.025) * cows.predict$se
# these are 95% confidence interval
# qnorm(0.025) is a negative value 
lower
upper
plot(cows,type='o')
plot(cows, type='o',xlim = c(0,180))
plot(cows,type='o',xlim=c(0,190))
points(cows.predict$pred, col = 'red') # represent prediciton mean value
lines(y=lower, x = 177:186, col = 'red',lty = 'dashed')
lines(y=upper, x = 177:186, col = 'red',lty = 'dashed')
length(upper)
# transform if not stationary then predict 