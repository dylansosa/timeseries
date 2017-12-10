library('TSA')
data('electricity')
plot(electricity,type='o')
plot(diff(electricity),type='o')
# varaince increases in both
# The mean in first order diff is indepenent of time t
plot(log(electricity),type='o')
acf(log(electricity))
acf(diff(log(electricity)))
# a little different, still have spikes 
plot(diff(log(electricity)),type='o')
# variance has become close to constant 
# LOG FIRST THEN DIFFERENCE
# DIFFERENCE IS ALWAYS LAST STEP
# TRANSFORMATION IS FIRST 
# If we choose log, that means lambda is = 0
# How to find lambda value?
BoxCox.ar(electricity)
# is close to 0, so we choose lambda to be 0
# gives maximum likelihood estimator 
# typically choose an int, but can do 1.5 or something if you have to. 
plot(diff(log(electricity)),type = 'o')
# ARIMA model, still not stationary 
# first order difference, now this first order difference becomes more like a stationary process 
acf(diff(log(electricity)))
# not stationary, even tho mean and var are alost constant
# Only seasonal data you might observe this type of ACF
# After transformation var is close to constant and then first order diff looks like stationary
# This is seasonal. Be careful because it has some oscillation 

# When not stationary. If nonstationary mean might be dependent on t. Figure our trend, deterministic trend, polynomial, or linear trend. 
# Take this trend out. Do this by differencing.
# For variance: check if time dependent or not. Check BoxCox transformation.
# If var is dependent on time, transformation first then difference.
# For mean trend, difference is last time.
# Var is in first time.
# Get a lambda, then transform the data to difference. 
# Check acf at each step. Each acf will tell if you got a stationary process or not. 
# Determine what order p and q.