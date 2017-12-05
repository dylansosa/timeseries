# Time Series Final Project
# Fall 2017
# Due: 12/05/17
# Megan Pagliaro and Dylan Sosa
# Dr. Haijun Gong

# Dataset information: 
# Average Annual River flow, Nile at Aswan, 1870-1945
# From DataMarket. Source: Time Series Data Library (citing: Hipel and McLeod (1994))
library("TSA")
setwd("/Users/Dylan/Documents/SLU/5.1/Time Series/Project/")
nile = ts(read.table(file = "nile.txt"), start = 1870, deltat = 1)
plot(nile, type='o', main='Average Annual River Flow of Nile at Aswan', ylab='Average River Flow Discharge(m³/s)', xlab='Year')
par(mfrow=c(2,2))
acf(nile)
pacf(nile) # one peak, but will transform 

# -------transformation-----------
BoxCox.ar(nile) # close to 0, use log 
nile.log = (log(nile))
plot(nile.log, type='o', main='Log Transformed Average Annual River Flow of Nile at Aswan', ylab='Average River Flow Discharge(m³/s)', xlab='Year') #no significant change
par(mfrow=c(2,2))
acf(nile.log)
pacf(nile.log)

# first order difference transformation [I(1)]
nile.log.diff = (diff(log(nile)))
plot(nile.log.diff, type='o', main='Average Annual River Flow of Nile at Aswan', ylab='Average River Flow Discharge(m³/s)', xlab='Year')
par(mfrow=c(2,2))
acf(nile.log.diff) #No significant peaks, weak MA and need to do second order difference
pacf(nile.log.diff) #No significant peaks, weak AR and need to do second order difference 

# ------second order difference [I(2)]------
nile.log.diff.diff = (diff(diff(log(nile))))
nile.transformed <- nile.log.diff.diff
abline(h=0, col = 'red')
plot(nile.transformed, type='o', main='Transformed Average Annual River Flow of Nile at Aswan', xlab='Year', ylab='(diff(diff(log(nile))))')
mean(nile.transformed) # very close to zero
par(mfrow=c(2,2))

acf(nile.transformed) # MA1 # Can we assume MA(1) 
pacf(nile.transformed) # AR(1) or AR(2) 
adf.test(nile.transformed)

# --------------eacf use -----------
eacf(nile.transformed, ar.max = 5, ma.max = 5) #Suggesting an AR(0)/MA(1). BUT because MA showing weak movement at 7, row down may be more significant, meaning MA(1)/weak AR(1),
# eacf shows AR(0), MA(1)

# ------Finding Coefficients--------
nile.subset = armasubsets(y=nile.transformed, nar=5, nma=5, ar.method='ols')
plot(nile.subset) #The BIC score is the same for the first two rows (-21), so choose simpler model. 
# Simpler model is AR(1)MA(1) (second row)

# ------Fitting model---------------
nile.fit = arima(nile.log, order=c(0,2,1), method='ML') 
nile.fit # These values for model. 
# theta = 1
plot(nile.fit)

# -----------forecasting-----------
nile.predict = predict(nile.fit, n.ahead = 60)
nile.predict

upper = nile.predict$pred + qnorm(0.975) * nile.predict$se
lower = nile.predict$pred - qnorm(0.975) * nile.predict$se

points(nile.predict$pred, col = 'red') # represent prediciton mean value

lines(y=upper, x = 1945:2004, col = 'green')
lines(y=lower, x = 1945:2004, col = 'green')