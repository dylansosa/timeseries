# How to calculate regression base 0 and base 1 coefficients 
setwd('/Users/Dylan/Documents/SLU/5.1/Time Series')
temps = read.table('globaltemps.txt')
head(temps)
# need to convert to time series data 
timedata = ts(temps, start = 1856) # gives time lag for each data pt
plot(timedata)
plot(timedata, type = 'o')
# window can choose a subset of data to analyze
temps1 = window(timedata, start = 1900)
plot(temps1, type = 'o')
temps2 = window(timedata, start = 1900, end = 1990)
plot(temps2)

# assume there is a trend in this process with base 0 and base 1
fit = lm(temps1 ~ time(temps1)) #lm is linear model, linear regression
# y is data, x is time data! Like axes values 

# y base 0 + base 1 * x
# normally would be y = beta0 hat + beta1 hat * x
# base 1 is slope. Positive means increasing 
fit
t = time(temps1)
head(t)
summary(fit)

# null hypothesis is b1 == 0
# if smalll p value, strongly reject null hypothesis, b1 is != 0
# p < 0.01 strongly reject null hypothesis H_0, beta1 should not be 0
# p < 0.05 we reject H0
# p < 0.1 weakly reject, cannot reject normally 
# if p > 0.1, coefficients prob close to 0. Cannot reject

abline(fit)
# make a fitted line on data. It is the deterministic trend. 

plot(resid(fit))
# plot residuals which are stationary from data

library('TSA')
data(gold)

t = time(gold)
ts = t^2
fit = lm(gold ~ t +ts)
fit
summary(fit)
plot(gold, type = 'o')

curve(expr = fit$coef[1] + fit$coef[2] *x + fit$coef[3]* x^2, col = "red", add = TRUE)
# curve to fit original data
# expression == model
# Use x not t, this is a requirement of the fxn 
# this is called a linear regression
# means coefficients are linear. b0, b1, b2, ...
# could extend to b1 to bn
# y = b0 + b1*x1 + ... + bn*xn

plot(resid(fit))
# it is fit data - trend
# difference might be like a stationary process 

data(beersales)
plot(beersales)
points(beersales, x = time(beersales), pch = as.vector(season(beersales)))
# pch here gives first letter of month
# seasonality data here, also containts seasonal trend 
# this is a deterministic behavior. Oscilliation is deterministic. Not stochastic.
# data before 1980 is smaller than after 80, then keep stable 
cutbeer = window(beersales, start = 1980)
plot(cutbeer, type = 'o')
# each beta corresponds to a month 1...12
# seasonal mean model 
# choose each months mean to describe this model. Use coefficents 1..12 for each month 
# it is constant 

month = season(cutbeer)
# sum every month then divide by number of years 
# season gives the months 
fit = lm (cutbeer ~ month-1) # -1 to remove intercept, the b0
fit
# so for each month its just a b0

# need to build a cosine model for this oscillation trend 

cutbeer
