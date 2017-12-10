library("TSA")
data("CREF") # retirement account, stock market related
CREF # 500 days between 2004 and 2006
plot(CREF)
plot(CREF,type="o") # stock price is increasing. This is a positive trend 
# trend can be upward or downward, linear or nonlinear.
# Trends gives long-term behavior with time 
# First thing to do when analyzing TS data is to check if there is a trend

data("tempdub") # monthly temp from 64 to 75
tempdub
plot(tempdub,type="o") # each circle is one data point for each month 
# the behavior of this plot is called seasonality. Seasonal for each year. Should check if data is seasonal or not after looking for trend.
# does trend exist or not? Trend refers to only long-term behavior. 
# Seasonal is short term pattern. Not a long-term behavior  

data("hare") # abundance of rabbit since 1905 to 1935
hare
plot(hare,type="o") # this is a cyclical pattern because it is long-term behavior, 
# the trend is long-term as well. Not correct to describe with the trend.

# Patterns in TS data
# 1. Trend
# 2. Seasonal
# 3. Cyclical 

white = rnorm(150, 0, 1) # 150 time points, mean is 0, and var (sigma) is 1.
plot(white, type = "o") # this is white noise, stochastic, fluctuates around 0.
# assume mean is 0 for white noise. Is a constant. Normal distrib describes white noise. 
