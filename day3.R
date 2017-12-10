library('TSA')
white = rnorm(150, 0, 1)
walk = white * 0
walk = rep(0,150)
walk = cumsum(white)
# cumulative summation. Means the walk vector, at each iteration is equal to white 0 + white 1, white 1 + white 2, etc.
# same as writing a for loop
# for(i in 1.:150){
#   walk[i] = sum(white[1:i])
# }

plot(walk,type='o')

# Moving Average 
movavg <- filter(x = white, filter = rep(1/3,3), method = 'convolution', sides = 1) # filter is the coefficient 
# can give multiple filters if you make filter var a vector
plot(movavg,type='o')
help(filter)

# Auto Regressive
# arima = auto regressive integrated moving average 

# ar is auto regressive process 
autoreg = arima.sim(model = list(ar = c(0.75)), n = 150, rand.gen = rnorm, sd = 1)
plot(autoreg, type = 'o')
# coefficient is like a slope

# Stochastic and Deterministic 
t = 1:156
sinfun = 2 * sin(2*pi*t/52)
w = rnorm(156,0,1) # omega
plot(sinfun, type = 'l')
par(mfrow=c(2,2)) # two row two column to plot multiple plots!!
plot(sinfun + w, type = 'l') # becomes a stochastic process 
plot(sinfun + 2*w, type = 'l') # becomes a stochastic process 
plot(sinfun + 4*w, type = 'l') # becomes a stochastic process 

# figure out a way to use deterministic methods to remove them
# or use stochastic to cover deterministic 
