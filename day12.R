wn = rnorm(150)
rw = cumsum(wn)
plot(rw, type = 'o')
# to check if stationary: check ACF. ACF should decay a little fast. THe numbers should be about 0.2, or smaller than 0.2. SHould be close ot zero
acf(rw) # not stationary because variance is dependent on time t
# if acf decays slowly, then this process is most likely non-stationary
# Must then remove non-stationary parts 
plot(diff(rw),type='o')
# diff() returns lagged and iterated differences 
acf(diff(rw))
# This acf is rho0, it's meaningless. The others are within 0.2. This is a smaple, so all the correlation acf are zero. Most likely they are independent. 
# If indep, they are stationary. 
# Alwyas assume whiten ouse is indep, so it is stationary 
ventiliation = ts(read.table(file = "http://stat.slu.edu/~gong/Teaching/ventilation.txt"))
ventiliation
plot(ventiliation, type = 'o')
# Not stationary bc mean is increasing 
# cannot use arma model to describe 
acf(ventiliation)
# for arma process, not possible to get more than 10 around 0.2
# for this process rhoK is non-zero, not stationary 
plot(diff(ventiliation),type='o')
# first order difference 
acf(diff(ventiliation))
# rho0 and rho1 are not less than 0.2, but the rest are 
# peaks on the left side are most important. so rho2 is important, some like rho9 can be ignored
# first order difference is likely stationary
# MA decays quickly, this could be MA(1)
acf(diff(diff(ventiliation)))

globaltemps = ts(read.table(file = "http://stat.slu.edu/~gong/Teaching/globaltemps.txt"))
plot(globaltemps,type='o')
acf(diff(diff(globaltemps)))
# this model might be quadratic. dependent on t^2
globaltemps
# given some TS data, visualize the ncheck acf, then test if first or second order are stationary or not 
# most cases is ns not possible to move ot third
# if second is not stationary, there might be some oscillation or seasonal data 

sim = arima.sim(list(order = c(1,1,0), ar = c(0.7)), n = 150)
plot(diff(sim),type='o')
acf(diff(sim))
# non stationary process 
# MA decay very fast
# AR decay slowly, rhok is phik
sim2 = arima.sim(list(order = c(0,1,1), ma = c(-0.7)), n = 150)
plot(sim2,type='o')
acf(sim2)
# not possible ot have so many large rhok, this is not a stationary process 
plot(diff(sim2),type='o')
acf(diff(sim2))
# this is MA because it decays really fast 