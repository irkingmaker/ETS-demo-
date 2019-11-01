data("AirPassengers")
AP<-AirPassengers
str(AP)
head(AP)
ts(AP,frequency=12,start=c(1949,1))
attributes(AP)
plot(AP)
AP<-log(AP)
plot(AP)
library(forecast)
#simple exponential smoothing
ses=ets(AP,model="NNN")
plot(forecast(ses))
summary(ses)

#double exponential smoothing
des=ets(AP,model="AAN")
plot(forecast(des))
summary(des)

#double exponential smoothing with dampening
desd=ets(AP,model="AAN",damped=TRUE)
plot(forecast(desd))
summary(desd)

#seasonal smoothing(additive)
ssa=ets(AP,model="AAA")
plot(forecast(ssa))
summary(ssa)

#seasonal smoothing(multiplicative)
ssm=ets(AP,model="ZAM")
plot(forecast(ssm))
summary(ssm)

#seasonal smoothing(multiplicative)
ssm=ets(AP,model="ZAM",damped=TRUE)
plot(forecast(ssm))
summary(ssm)

#Automatic model selection
obj=ets(AP)
plot(forecast(obj))
summary(obj)
