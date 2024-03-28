
library(MASS)  
library(leaps)  
library(car)   
library(Metrics)

# Multiple Linear Regression ----------------------------------------------


# Data --------------------------------------------------------------------

? Boston

dim(Boston)
head(Boston)
str(Boston)
summary(Boston)

# Train, val, test
# https://stackoverflow.com/questions/36068963/r-how-to-split-a-data-frame-into-training-validation-and-test-sets
spec = c(train = .6, validate = .2, test = .2)

set.seed(123)
g = sample(cut(
  seq(nrow(Boston)), 
  nrow(Boston)*cumsum(c(0,spec)),
  labels = names(spec)
))

res = split(Boston, g)

boston_train <- res$train
boston_val <- res$validate
boston_test <- res$test

# Creating 3 Models -------------------------------------------------------
# In "reality", more focus can be put on the diagnostic plots then we do 
# for assessing how reliable statistical inference is. 

# 1. Using "logic" / Theory
lm_1 <- lm(medv ~ crim + indus + nox + age + dis + ptratio, data = boston_train)
summary(lm_1)
# Rule of thumb: Points above  1 for Cook's Distance indicate that these 
# points may be influential points, i.e. points that have a large
# influence on our fitted model and could be inspected. 
par(mfrow = c(2, 2))
plot(lm_1)

vif(lm_1)

# 2. Starting from the full model
lm_2 <- lm(medv~. + lstat:age, data = boston_train)
summary(lm_2)

# We decide to only keep significant variables, but in general
# you might want to keep variables that are not significant. Check this link:
# https://stats.stackexchange.com/questions/271434/when-should-one-include-a-variable-in-a-regression-despite-it-not-being-statisti

lm_2 <- lm(medv~. - indus - age, data = boston_train)    
summary(lm_2)

par(mfrow = c(2, 2))
plot(lm_2)

vif(lm_2)

# 3. Best subset regression
# Diagnostic plots as above not included, focus on demonstrating 
# that we can apply best subset regression easily.

lm_3 <- regsubsets(medv ~., data = boston_train, nvmax = 13)
lm_3_summary = summary(lm_3)
lm_3_summary

names(lm_3_summary)
par(mfrow = c(1, 1))
plot(lm_3_summary$adjr2)
lm_3_summary$adjr2

coef(lm_3, 3)
plot(lm_3, scale = "adjr2")

lm_3 <- lm(medv ~ rm + ptratio + lstat, data = boston_train)    
summary(lm_3)


# Evaluation --------------------------------------------------------------

val_pred_m1 <- predict(lm_1, newdata = boston_val)
val_pred_m2 <- predict(lm_2, newdata = boston_val)
val_pred_m3 <- predict(lm_3, newdata = boston_val)

results <- data.frame(
  Model = c("Model 1", "Model 2", "Model 3"),
  RMSE_val_data = c(rmse(boston_val$medv, val_pred_m1),
                    rmse(boston_val$medv, val_pred_m2),
                    rmse(boston_val$medv, val_pred_m3)),
  Adj_R_squared = c(summary(lm_1)$adj.r.squared,
                    summary(lm_2)$adj.r.squared,
                    summary(lm_3)$adj.r.squared),
  BIC = c(BIC(lm_1), BIC(lm_2), BIC(lm_3))
)

# In reality, not sure we get the same ranking for different metrics as 
# is the case here.
results

# Evaluating our chosen model (lm_2) on the test data.
test_pred_m2 <- predict(lm_2, newdata = boston_test)
rmse(boston_test$medv, test_pred_m2)


# Inference for model 2 ---------------------------------------------------
# In reality, before doing inference, analyze diagnostic plots. 

summary(lm_2)  # Hypothesis testing

confint(lm_2)

# New data that we want to predict
new_data <- data.frame(
  crim = c(3.5, 3),
  zn = c(10, 8),
  indus = c(7, 5), 
  chas = c(0.05, 0.07),
  nox = c(0.5, 0.6),
  rm = c(6, 6.3),
  age = c(45, 63), 
  dis = c(4, 3.8),
  rad = c(9.5, 7),
  tax = c(330, 280),
  ptratio = c(19, 20),
  black = c(391.4, 395),
  lstat = c(11.5, 14)
)

# Create CI & PI for predictions
confidence_intervals <- predict(lm_2, newdata = new_data, interval = "confidence", level = 0.95)
prediction_intervals <- predict(lm_2, newdata = new_data, interval = "prediction", level = 0.95)

confidence_intervals
prediction_intervals

