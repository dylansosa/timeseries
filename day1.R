setwd('/Users/Dylan/Documents/SLU/Semester 5.1/Time Series')
library('TSA')
data('larain')
larain
#plot(larain)
plot(larain, type = 'o', main = 'LA Rainfall Time Series per Year', xlab = 'Year', ylab = 'Inches') # 'o' makes small circles for each point 

plot(x = zlag(larain), y = larain) # zlag() means first value of x axis is 20.86 as shown in the values of the time series. Always choose the past point. Y cannot be the first value because it does not have the past record. X cannot take the last value because there is no Y to base it on. 
# on the above plot, (x is future and y is history?). Not a good dataset because we cannot make any predictions. 

data(color)
plot(color)
plot(color, type = 'o')
plot(x = zlag(color),y=color)
# long term is increasing. 