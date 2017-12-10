library(TSA)
par(mfrow = c(2,2))
y = ARMAacf(ar = c(0.5, -0.5), lag.max=20)
# population acf, need params: phi1, phi2
# Should be stationary 
plot(y,type='o')
plot(y,type='h')
y = ARMAacf(ar = c(1.1, -0.3), lag.max=20)
plot(y,type='h')
y = ARMAacf(ar = c(-0.5, 0.25), lag.max=20)
plot(y,type='h')
# diff phi makes very diff plots
par(mfrow = c(2,2))
sim1 = arima.sim(list(order=c(2,0,0), ar=c(0.5,-0.5)),n=100)
plot(sim1,type='o')
y = ARMAacf(ar = c(0.5, -0.5), lag.max=20)
plot(y,type='h')

sim2 = arima.sim(list(order=c(2,0,0), ar=c(1.1,-0.3)),n=100)
plot(sim2,type='o')
y = ARMAacf(ar = c(1.1, -0.3), lag.max=20)
plot(y,type='h')

sim3 = arima.sim(list(order=c(2,0,0), ar=c(-0.5,0.25)),n=100)
plot(sim3,type='o')
y = ARMAacf(ar = c(-0.5, 0.25), lag.max=20)
plot(y,type='h')

# check rho1 on any kind of data.
# ro1 values will decide the pattern of the data 
# rho2 could contribute some, but rho1 is most important 
# acf is always used to describe the stock market price 
# yesterday price is strongly correlatd with today's 
# Many eyars ago, still correlated to today, but small 
 