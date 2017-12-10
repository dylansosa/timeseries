data('TSA')
sim1 = arima.sim(list(order=c(0,0,1), ma=c(-0.5)), n=100)
plot(sim1)
acf(sim1)

sim4 = arima.sim(list(order=c(2,0,0), ar = c(0.5,0.4)), n=100)
acf(sim4)
# MA decays FAST
# AR is SLOW
# Cannot idenify the auto regressive order using acf
# acf only used to identify order of MA. That is p value, cannot find q
# Need another quanitiy not acf to infer order of AR process
pacf(sim4)
# because two spikes above threshold, AR(2)
acf(sim4)
# for very low order sometimes cannot distinguish r and ma
sim2 = arima.sim(list(order=c(9,0,2), ar=c(-0.5,0.5)),n=100)

# always check acf first, if it tells u it is MA, then it is highly plausible it is a MA 
# if u use acf and find it decays slowly and looks like AR, then switch to pacf
# Only if MA process is ruled out 

# Time series data is more complicated 
# because of stochastic effect and they are not independent 

ARMAacf(ar=c(0.5,0.4),lag.max=20)
ARMAacf(ar=c(0.5,0.4),lag.max=20, pacf=TRUE)
# ARMAacf is only used when knowing phi and theta and order 

# only 2 acf greater than 0 
# pacf can be used to identify order of AR process
# always use acf to check first 
# if you check if one process is stationary or not, always use acf 
# then pacf
# only if MA is ruled out then you use pacf 

# when you build a model with very large orders 
# for time series data we believe the current time point is only dependent on most recent data point
# so order p and q should not be very large
# most cases p and q not greater than 4 or 5

# extended acf can be used to identify both pa and q 
sim5 = arima.sim(list(order=c(1,0,1), ar = c(0.6), ma =c(0.8)), n=100)
plot(sim5)
acf(sim5)
# MA or AR?
# seems like MA

pacf(sim5)
# looks like AR 2

eacf(sim5)
# Used to identify order p and q
# eacf is not very clean 
# not as good as acf and pacf
# because arma model is more complicated that the other two 
# it depends on data and doesnt generate a figure 
# p is y q is x
# not good dsta to use eacf
sim5 = arima.sim(list(order=c(1,0,1), ar = c(0.6), ma =c(0.8)), n=200)
eacf(sim5)
# looking for a triangle in the xo matrix
# called a wege 
# x with no o on left, all o on right 
# hope to see o only on right side 
# looks like 1,1

sim6 = arima.sim(list(order=c(2,0,2), ar = c(0.6,-0.5), ma = c(0.8,-0.2)), n=500)
acf(sim6)
# seems like MA 3, but not a good one. normally left side should be larger 
pacf(sim6)
# 5 pacf non-zero, still same problem. magnitude should decrease 
# might not be AR only, could be mixing model
eacf(sim6) # notes are based on n = 200
# both 2,2 and 3,1 are reasonable
# remember philosophy that we try to make both p and q as small as possible 
# if you find this is arma 5,1 or 2,2
# then you should prefer 2,2 
# only AR contribution can be a little larger than MA 
# this is how to build model 

# acf determines order of purely MA
# pacf determines order of p and is purely AR
# eacf determines mixed ARMA 
# always do this order -> acf, pacf, eacf 

# with studying trends we normally used the difference 
# when you find some data they ahve a deterministic trend
# use difference to remove and then you get ARIMA model
# how many differences should you use?
# we have the same philosophy, that is the order d should be as small as possible 
# in the past when we build the model, if the first order difference becomes sttionary, then second and third etc should be stationary 
# do not over differentiate 
# in regression we sometimes called it overfitting 


