# Simple Linear Regression ------------------------------------------------

# Parameter estimation and prediction -------------------------------------

# Storing data in a dataframe
age_salaries <- data.frame(
  person_id = 1:8,
  age = c(33, 45, 28, 58, 29, 47, 33, 19),
  salary = c(39500, 37500, 42000, 53900, 28200, 73100, 39400, 27200)
)

# View the data
print(age_salaries)

# Create a simple linear regression model
model <- lm(salary ~ age, data = age_salaries)

# Summary of the regression model, we also see R^2
summary(model)

# Predicted salary of a 20 year old person
model$coefficients["(Intercept)"] + model$coefficients["age"]*20

new_data <- data.frame(age = c(20))
predict(model, newdata = new_data)

# Plot the data points and the regression line
plot(age_salaries$age, age_salaries$salary, main = "Simple Linear Regression", xlab = "Age", ylab = "Salary")
abline(model, col = "red")

# Inference ---------------------------------------------------------------

# p-values for testing the null hypothesis that the
# beta coefficients are equal to 0.
summary(model)

# Confidence interval for parameters
confint(model)

# Confidence intervals and prediction intervals for predicted values
# Interval for the average salary
predict(model, data.frame(age = c(21, 53)), interval = "confidence")
# Interval for an individuals salary
predict(model, data.frame(age = c(21, 53)), interval = "prediction")
