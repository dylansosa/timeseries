library('tseries')
library('TSA')
temp = ts(read.table(file='http://cs.slu.edu/~gong/Teaching/globaltemps.txt'), start = 1856)

plot(temp)
# not stationary 
# use methods to check if stationary or not

adf.test(temp)
# we get large p-value

adf.test(diff(temp))
# 0.01 after first order difference
# can claim first order difference becomes stationary 
plot(diff(temp))
mean(diff(temp))
acf(diff(temp))
pacf(diff(temp))

data(larain)
plot(larain)
adf.test(larain)
# p-value of 0.05 
# almost like a stationary process based on figure 
acf(larain)
# kind of stationary, not very strong evidence

adf.test(diff(larain))
# now p-value is 0.01
# if given data try to combine acf and adf to check if stationary or not 
# if both test and first order tell you non-stationary think about doing transformation 

data = ts(read.table(file='http://cs.slu.edu/~gong/Teaching/ventilation.txt'))
plot(data, type = 'o')
# non-stationary 
adf.test(data)
adf.test(diff(data))
plot(diff(data))
# becomes stationary and p-value is 0.01
acf(diff(data))
# MA(1)
pacf(diff(data))
# looks like AR(3) not very possible.

d1 = armasubsets(y = diff(data), nar = 5, nma = 6, ar.method = 'ols')
# bc original data is not stationary, give differened 
# CAN NEVER BUILD NON-STATIONARY MODEL
# given a non-stationary model, not possible to find p,q
# can only find phi, theta for non-stationary 
# nar is max p value
# nma is max q value 
# ar.method is what is being used to build model 
plot(d1)
# armasubsets() 
# think of model selection as subset selection
# can choose any kind of p, q or both 
# can choose subsets of p,q values to minimize BIC 
# bc we need to minimize BIC score, find shaded area corresponding to lowest value
# errorlag1 is et-1, etc
# bc it is shaded at the above line, it only depends on et-1
# so it is MA(1)
# yt = theta1 - et-1
# only dependent on subset 