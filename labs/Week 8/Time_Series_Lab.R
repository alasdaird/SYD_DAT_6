
# Install required packages -----------------------------------------------
install.packages("forecast")
install.packages("fpp")
install.packages("ggplot2")


# load those packages to the current session ------------------------------
library(ggplot2)
library(forecast)
library(fpp) # get a dataset to work with from 'fpp' - datasets from forecasting principles and practice

View(elecequip)

# Explore elecequip dataset -----------------------------------------------
?elecequip
plot(elecequip)
head(elecequip)
class(elecequip)  # ts class
elecequip
View(elecequip) 


# Decompose time series with STL ------------------------------------------
# Time-Series Components
fit <- stl(elecequip, s.window=5)  #seasonal decomposition 
plot(fit) # show the components
autoplot(fit)  # plot with ggplot2


# Plot elecequip time series ----------------------------------------------
plot(elecequip, col='gray',
     main="Electrical Equipment Manyfacturing",
     ylab='New orders index', xlab="")
lines(fit$time.series[,2], col="red", ylab="Trend")



<<<<<<< HEAD

=======
>>>>>>> upstream/master
# Apply Exponential Smoothing to Oil Data ---------------------------------
plot(oil)
?oil
# Exponential smoothing model - with different Alpha smoothing and H perio parameter settings
fit1 <- ses(oil, alpha=0.2, initial="simple", h=3) # alpha=smppthing parameter  h=periods
fit2 <- ses(oil, alpha=0.6, initial="simple", h=3)
fit3 <- ses(oil,  h=3)
fit4 <- ses(oil, alpha=0.6, initial="simple", h=1)
# Plot the model fit (training data)
plot(fit1, plot.conf=FALSE, ylab="Oil (millions of tonnes)",
     xlab="Year", main="", fcol="white", type="o")
lines(fitted(fit1), col="blue", type="o")
lines(fitted(fit2), col="red", type="o")
lines(fitted(fit3), col="green", type="o")
lines(fitted(fit4), col="yellow", type="o")

# PLot the forecast
plot(fit1, plot.conf=FALSE, ylab="Oil (millions of tonnes)",
     xlab="Year", main="", fcol="white", type="o")
lines(fit1$mean, col="blue", type="o")
lines(fit2$mean, col="red", type="o")
lines(fit3$mean, col="green", type="o")


# Holt Winters
aust <- window(austourists, start=2005)
plot(aust)
fit1 <- hw(aust, seasonal="additive")
fit2 <- hw(aust, seasonal="multiplicative")

plot(fit2, ylab="International visitnor night in Australia (millions)",
     plot.conf=FALSE, type="o", fcol="white", xlab="Year")
lines(fitted(fit1), col="red", lty=2)
lines(fitted(fit2), col="green", lty=2)
#add the forecasts
lines(fit1$mean, type="o", col="red")
lines(fit2$mean, type="o", col="green")




# Monthly anti-diabetic drug sales in Australia from 1992 to 2008 ---------
?a10

# Seasonal Differencing
plot(a10)
plot(log(a10))  # variance (as well as the scale) reduces for the log values

# for exponential models, differencing ones gives you a striaght line, differencing twice, straight
plot(stl(a10, s.window=12))
plot(stl(log(a10), s.window=12))

plot(diff(log(a10), s.window=12))


WWWusage
diff(WWWusage)



# ARIMA model on diabetes dataset -----------------------------------------
# ARIMA Model
?WWWusage
tsdisplay(diff(WWWusage), main="")
fit <- Arima(WWWusage, order=c(3,1,1))
summary(fit)
plot(forecast(fit))
# now using auto method for selecting order
fit1 <- auto.arima(WWWusage)
plot(forecast(fit1))
summary(fit1)
# for a10 dataset
fit2 <- auto.arima(a10)
plot(forecast(fit2))
summary(fit2)



# Evaluate forecast models using Australian beer dataset ------------------
# Evaluating the models
beer2 <- window(ausbeer, start=1992, end=2006-.1)

beerfit1 <- meanf(beer2, h=11)
beerfit2 <- rwf(beer2, h=11)
beerfit3 <- snaive(beer2, h=11)
beerfit4 <- auto.arima(beer2)

plot(beerfit1, plot.conf=FALSE,
     main="forecasts for quaterly beer production")
lines(beerfit2$mean, col="red")
lines(beerfit3$mean, col="green")
plot(forecast(beerfit4), col="grey")
lines(ausbeer)





