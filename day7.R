library(TSA)
simdata = arima.sim(list(order=c(0,0,1), ma = -0.9), n = 100)
par(mfrow=c(2,2))
plot(simdata)
acf(simdata)
# first peak is always rho0
# samples. Mag is within 0.2, assume is not correlated. Just around 0 we assume. 
y = ARMAacf(ma=-0.9)
# autoregressive moving aerage auto correlation function
y
# 0 is rho0, 1 is rho1
plot(y,x=0:2,type='h')
simdata2 = arima.sim(list(order=c(0,0,2), ma = c(-0.8,0.7)), n = 100)
# theta1 = 0.8, theta1 = -0.7
plot(simdata2,type='p')
par(mfrow=c(2,2))
# first thing is to get acf if you have no idea about the data
acf(simdata2)
# gives sample ppopulation results
ARMAacf(ma=c(-0.8,0.7))
# this gives theoretical results 
# do not consider the high order time lag, it's noise 

plot(x=zlag(simdata2,1),simdata2,type='p')
# x is yt-1, y is yt
# negatively correlated, consistent with acf
# any time pot yt is always neg corr with most adjacent point in this example
plot(x=zlag(simdata2,2),simdata2,type='p')
# this is yt-2 on x and yt on y
plot(x=zlag(simdata2,3),simdata2,type='p')
# not correlated 

simdata3 = arima.sim(list(order=c(1,0,0), ar=-0.9),n = 100)
# autogressive process 
# phit = phi1*yt-1
# phi == 0.9
par(mfrow=c(2,2))
plot(simdata3)
# should have positive acf bc ohi is 0.9
acf(simdata3)
# sample data 
# yt is always correlated with history 

# MA has short memory
# if time lag is big, correlation is 0

# AR has long memory 
# history data always influence the future
# after a long time, the influence becomes smaller, that is, the acf becomes smaller
# if phi == 1, 

ARMAacf(ar = c(-0.9),lag.max=10)
# lag.max gives number of phis to show

# changing phi to -.0.9 shows the alternating acf pattern
# sample acf 
# plot looks like seasonal, but it's just noice 