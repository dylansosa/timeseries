library(TSA)
data(beersales)
sales = window(beersales, start = 1980)
plot(sales)
hardata = harmonic(sales, 1)
# for season data because we need to build cos and sin; so all the data if put in harmonic we 
# will think about cos and si nas a function. 
# The second argument is one. This is f. 
# this is the format of the data. 
fit = lm(sales ~ hardata)
fit
# this gives us the sin and cos coefficients 
plot(sales, type = 'o')
summary(fit)

plot(ts(fitted(fit), freq=12, start=c(1980,1)))
# plotting to see if our predicted model works well or not. ts is timeseries data. Fitted uses the results of lm. 
# Gives fitted results of any time point or predicted value. Frequency will be points. 
# Should know every point is one year. 
# Point is observed value.
# line is fitted value 
# We get cosine trend; this is a seasonal trend. 
points(sales)

# if we get difference, Yt - the beta and cos and sin part of the formula
# we will see if it is stationary or not. 
plot(resid(fit))
# this gives us Xt
# fitted gave predicted value.
# residue gives you difference between Yt and deterministic model. This == Xt
# Residue has stochastic effect.
# It is more stationary-looking know.
# No oscillation behavior now 

# if you find there is a seasonal pattern your should think about using cosin model.
# for residue, it might follow stationary process, but it might not be true. 

# Moving Average
simdata = arima.sim(list(order=c(0,0,1),ma = 0.9), n = 100)
# tell the value of q. In this process q is one, and the two zeros are auto regressive process. 
# so moving average 1
# ma = theta
# However, in R, moving average 0.9, theta will coreespond to -0.9
# SO write 0.9 to mean -0.9 and vice versa.
plot(simdata,type='o')
# MA(1)
# q = 1
# theta = -0.9
acf(simdata)
# Calculates autocorrelation function
# The first peak is rho one. 
# Will rewrite bc we had two spikes
# first spike is rho1. Time lag is only 1. 
# Describes auto correlation between Yt and Yt-1
# This autocrr is close to 0.5
# Theory says if theta is close to -1, will get auto correlation rho == 0.5
# Our sim shows this is true bc we used -0.9, which is basically -1
# For other autocorrelations, they are smaller than magnitude 0.2 
# If others are smaller than 0.2, we assume they are not correlated. 
# Using ACF function will get a sample autocorrelation. 
# Sample vs. population
# In rho formula for k = 1, we use population autocorr function
# For sample ACF gives some data, but do not know parameters or q or theta. 
# So we generated sim data. Used ACF, then this is called sample.
# Each time we make new sim data, get new ACF sample. 
# Population autocorr is fixed if given theta. 

plot(y=simdata, x = zlag(simdata,1),type='p')
# y = simdata for Yt, x is zlag which means Yt -1
# So Y2, Y1, etc...Y100, Y99 = zlag(y,1)
# 99 pairs, not 100.
# Plotting relationship between Yt and Yt-1
# We see they are positively correlated. This is consistent with our ACF
# Also see pos correlation which agrees with positive ACF
plot(y=simdata, x = zlag(simdata,2),type='p')
# y = y3, x = y1. Two time point lag. (Yt, Yt-2)
# From population ACF we know they are not correlated atall and should be 0. 
# If we use simulation data we see they are not correlated and is around 0. 
# Can also test Yt and Yt-3; they are not correlated.
plot(y=simdata, x = zlag(simdata,3),type='p')

simdata = arima.sim(list(order=c(0,0,1),ma = -0.9), n = 100)
acf(simdata)
# Now with positive theta, rho is close to negative 0.5
# Remember negative theta in R means positive theta in theory. 
plot(y=simdata, x = zlag(simdata,1),type='p')
# Any type of data, after taking out determinisitc and calculating ACF
# You get a sample ACf. If you find there is only one spike. Pos or neg.
# Then you guess this data might follow the moving average one model. If no other spikes. 
# Moving average 1 is a simple case.
# Yt is only dependent on current and most recent history time point for the white noise. 

# MA2
simdata = arima.sim(list(order=c(0,0,2),ma = c(0.9, 0.7)), n = 100)
# now we have a vector of theta values. ma is vector
# q is 2
acf(simdata)
# Two spikes means Yt and Yt-1, Yt and Yt-2. 
# First spike is strongly correlated, second means it is correlated but not as strong.
