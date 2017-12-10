library('TSA')
setwd('/Users/Dylan/Documents/SLU/5.1/Time Series')
# White Noise and stationarity 
white = rnorm(150)
walk= white*0
walk = cumsum(white) # cumulative sum. Means walk 1 is e1 + e2, walk 2 is e1 + e2 + e3
plot(white, type ='o') # NOT stationary 

# Moving Average and stationarity 

# Autoregressive Process and stationarity 

# Deterministic Cosine Wave and Stationarity 

phi = runif(150)
t = 1:150
yt = cos(2*pi*(t/12 + phi))
plot(t, yt, type = 'o')

# this is stationary
# If not stationary, find a way to take non-stationary parts out

# Linear Regression with Rand Walk
data("rwalk")
time(rwalk)
rwalk
model = lm(rwalk ~ time(rwalk)) # lm() gets coefficients. Y ~ time t
model # coefficients base 0 and base 1. Base 0 is shown first. 
