huron = ts(read.table('http://stat.slu.edu/~gong/Teaching/huron.txt'),start = 1880)
plot(huron)
acf(huron)
huron.fit = arima(huron, order = c(1,0,0),method = 'ML')
huron.fit
# get phi and mu
# Yt - 579 = 0.85 (yt - 579) + et
# AR(1) process 
huron.predict = predict(huron.fit, n.ahead = 20)
huron.predict
# use predict fxn to make forecast 
# .fit is our model, contains phi value 
# n.ahead is l value 
huron.predict$pred
# give future values of l = 20
huron.predict$se
# error 
# use this to buld confidene interval 
# y hat +/- wnorm(alpha/2)*standard error
# this is to get confidence for prediction
# future value will fall in this interval 
lwr = huron.predict$pred + qnorm(0.025) * huron.predict$se
# this is lower bound
upr = huron.predict$pred- qnorm(0.025) * huron.predict$se
# upper bound 
lwr
upr
# tried to plot, but didnt work
