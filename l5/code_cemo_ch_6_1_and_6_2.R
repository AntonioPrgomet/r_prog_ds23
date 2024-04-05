
# Code demonstration: Model selection and Regularization, ch 6.1 and ch 6.2.

# Best Subset Selection ---------------------------------------------------

# install.packages('ISLR2')
library(ISLR2)

View(Hitters)
names(Hitters)
dim(Hitters)

# There are 59 missing values which we 
# remove and verify everything is correct.
sum(is.na(Hitters$Salary))
Hitters <- na.omit(Hitters)
dim(Hitters)
sum(is.na(Hitters))

library(leaps)
regfit_full <- regsubsets(Salary ~ ., Hitters)
# For example; best two variable model has "Hits" and "CRBI" columns
summary(regfit_full)

# We now look at 19 variables instead of 8 which is the default
regfit_full <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19)
reg.summary <- summary(regfit_full)

names(reg.summary)

# Plotting model evaluation with different metrics
par(mfrow = c(2, 2))

plot(reg.summary$rss, xlab = "Number of Variables", ylab = "RSS", type = "l")

plot(reg.summary$adjr2, xlab = "Number of Variables", ylab = "Adjusted RSq", type = "l")
which.max(reg.summary$adjr2)
points(which.max(reg.summary$adjr2), reg.summary$adjr2[11], col = "red", cex = 2, pch = 20)

plot(reg.summary$cp, xlab = "Number of Variables", ylab = "Cp", type = "l")
which.min(reg.summary$cp)
points(10, reg.summary$cp[10], col = "red", cex = 2, pch = 20)

which.min(reg.summary$bic)
plot(reg.summary$bic, xlab = "Number of Variables", ylab = "BIC", type = "l")
points(6, reg.summary$bic[6], col = "red", cex = 2, pch = 20)

# Another type of plot
?plot.regsubsets

par(mfrow = c(2, 2))
plot(regfit_full, scale = "r2")
plot(regfit_full, scale = "adjr2")
plot(regfit_full, scale = "Cp")
plot(regfit_full, scale = "bic")

par(mfrow = c(1, 1))
plot(regfit_full, scale = "bic")

# coef extracts for BIC, where can I see this in documentation???
coef(regfit_full, 6)


# Forward and Backward Stepwise Selection ---------------------------------

regfit_fwd <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19, method = "forward")
summary(regfit_fwd)

regfit_bwd <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19, method = "backward")
summary(regfit_bwd)

coef(regfit_full, 7)
coef(regfit_fwd, 7)
coef(regfit_bwd, 7)


# Ridge Regression and the Lasso ------------------------------------------
# In this section, we demonstrate: 
# (1) Ridge Regression
# (2) Creating train and test data (used both for (2) Ridge and (3) Lasso)
# (3) Lasso


# For glmnet(), y ~ x syntax is not used. We pass an x matrix and vector y.
# [, -1] removes the intercept. 
x <- model.matrix(Salary ~ ., Hitters)[, -1]  
y <- Hitters$Salary

### (1) Ridge Regression

library(glmnet)
grid <- 10^seq(10, -2, length = 100)
# Ridge: alpha=0, Lasso: alpha=1
ridge_reg <- glmnet(x, y, alpha = 0, lambda = grid)

# For each value of lambda (100 in total), there is a vector of
# ridge regression coefficients.
dim(coef(ridge_reg))

# Demonstrating that higher lambda yields smaller coefficients
ridge_reg$lambda[50]
coef(ridge_reg)[, 50]
sqrt(sum(coef(ridge_reg)[-1, 50]^2))

ridge_reg$lambda[60]
coef(ridge_reg)[, 60]
sqrt(sum(coef(ridge_reg)[-1, 60]^2))

### (2) Creating train and test data to evaluate model
set.seed(1)
train <- sample(1:nrow(x), nrow(x) / 2)
test <- (-train)
y_test <- y[test]

# Below we first choose lambda (s) arbitrarily, then 
# we will demonstrate cross-validation.

# Choosing lambda (s) = 4 arbitrarily
ridge_reg <- glmnet(x[train, ], y[train], alpha = 0, lambda = grid, thresh = 1e-12)
ridge_pred <- predict(ridge_reg, s = 4, newx = x[test, ]) 
mean((ridge_pred - y_test)^2)

# Benchmarking our ridge model with a "naive estimate" of using the mean
mean((mean(y[train]) - y_test)^2)

ridge_pred <- predict(ridge_reg, s = 1e10, newx = x[test, ])
mean((ridge_pred - y_test)^2)

ridge_pred <- predict(ridge_reg, s = 0, newx = x[test, ], exact = T, x = x[train, ], y = y[train])
mean((ridge_pred - y_test)^2)

# Lambda = 0 is simply least squares regression
lm(y ~ x, subset = train)
# Examining coefficients with the predict function
predict(ridge_reg, s = 0, exact = T, type = "coefficients", x = x[train, ], y = y[train])[1:20, ]

# Use CV instead of arbitrarily choosing lambda
set.seed(1)
cv_out <- cv.glmnet(x[train, ], y[train], alpha = 0, nfolds = 10)
plot(cv_out)
bestlam <- cv_out$lambda.min
bestlam

ridge_pred <- predict(ridge_reg, s = bestlam, newx = x[test, ])
mean((ridge_pred - y_test)^2)

# Refitting our ridge regression on the full data set
# and examine the coefficient estimates.
out <- glmnet(x, y, alpha = 0)
predict(out, type = "coefficients", s = bestlam)[1:20, ]

### (3) The Lasso
lasso_mod <- glmnet(x[train, ], y[train], alpha = 1, lambda = grid)
# Numbers at the top show number of non-zero coefficients
plot(lasso_mod)

# Using CV
set.seed(1)
cv_out <- cv.glmnet(x[train, ], y[train], alpha = 1)
plot(cv_out)
bestlam <- cv_out$lambda.min
bestlam
lasso_pred <- predict(lasso_mod, s = bestlam, newx = x[test, ])
mean((lasso_pred - y.test)^2)

out <- glmnet(x, y, alpha = 1, lambda = grid)
# Using the predict function to check coefficients
lasso.coef <- predict(out, type = "coefficients", s = bestlam)[1:20, ]
lasso.coef
lasso.coef[lasso.coef != 0]

