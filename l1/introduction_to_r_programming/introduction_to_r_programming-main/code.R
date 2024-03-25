
# Program starts ----------------------------------------------------------

# Installing packages
install.packages("dplyr")
install.packages("ggplot2")
install.packages("readxl")

# Loading packages
library("ggplot2")
library("dplyr")
library("readxl")

# Shows which packages are installed
library()

# Show which packages are currently loaded
search()

# "hello, world" ----------------------------------------------------------

print("hello, world")

# Variable assigment ------------------------------------------------------

# Standard approach to assign a variable
var1 <- "Leftward Assignment"
print(var1)

# Rightward assignment is possible
"Rightward Assignment" -> var2
print(var2)

# Equal sign works but does not follow the styleguide
var3 = 5
print(var3)

# Print out all the variables in workspace
ls()

# With "?" and "help()" you can read the documentation
?ls
help(ls)

# You can delete a variable
rm(var1)
ls()

# Delete all variables in workspace
rm(list = ls())
ls()

# Data structures ---------------------------------------------------------
# Below we are going to cover:
# 1. Vectors
# 2. Arrays
# 3. Matrices
# 4. Factors
# 5. Lists
# 6. Dataframes

# Vectors -----------------------------------------------------------------

# Creating a vector
v1 <- c(1, 3, 5, 7, 9, 11, 13)
is.vector(v1)

# Accessing elements
v1[4]
v1[c(3, 7)]

v1[-3] # All elements except the third
v1[v1 > 7] # Logical indexing

# Modifying elements
v2 <- c(1500, 7, 24, 2435, 98, 1432, 5000)
print(v2)

v2[1] <- 1422
print(v2)

v2[v2 > 1000] <- 2222
print(v2)

v2 <- v2[c(1, 5)]
v2

# Arrays ------------------------------------------------------------------

# Creating an array
arr1 <- array(2:14, dim = c(2, 3, 2))
is.array(arr1)

print(arr1)

# Attributes of our array
dim(arr1) # (2 3 2) meaning it has two (the last two) 2x3 matrices
print(nrow(arr1))
print(ncol(arr1))
print(length(arr1)) # Number of elements

# Creating an array with named dimensions
row_names <- c("row1", "row2")
col_names <- c("col1", "col2", "col3")
mat_names <- c("Mat1", "Mat2")

arr2 <- array(2:14,
  dim = c(2, 3, 2),
  dimnames = list(
    row_names,
    col_names, mat_names
  )
)
print(arr2)

# Accessing elements
arr1[, , 1] # Accessing first matrix from arr1
arr2[, , "Mat2"] # Accessing second matrix from arr2
arr1[, 1, 1] # Accessing first column in first matrix from arr1
arr2[1, , 1] # Accessing first row in first matrix from arr2

arr1[1, 2, 1] # Accessing the individual element at row 1 column 2 from matrix 1
arr1[, c(2, 3), 1] # All the rows from column 2 and 3 from matrix 1

# Modifying elements
arr1[1, 1, 1] <- 1234
print(arr1)

arr1[, 1, 1] <- c(234, 111)
print(arr1)

# Matrices ----------------------------------------------------------------

A <- matrix(
  c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  nrow = 3,
  ncol = 3,
  byrow = TRUE,
  dimnames = list(c("a", "b", "c"), c("c", "d", "e"))
)

is.matrix(A)
is.array(A) # Returns TRUE since a matrix is a two dimensional array

print(A)

# Attributes of our matrix
print(dim(A))
print(nrow(A))
print(ncol(A))
print(length(A)) # Number of elements

# Accessing and modifying elements is done in the same way as in arrays.
A[1:3, 1:2]

# Using rbind() to create a matrix by combining rows. cbind() also exists.
v1 <- 1:3
v2 <- seq(4, 8, 2)
v3 <- c(1, 1, 1)

B <- rbind(v1, v2, v3)
B

# Some matrix operations
print(A)
print(B)

A + B # Matrix addition (Linear Algebra)
t(A) # Matrix transpose (Linear Algebra)
A %*% B # Matrix multiplication (Linear Algebra)
A * B # Elementwise multiplication

# Factors -----------------------------------------------------------------

# Creating a vector and then converting it to a factor
x <- c("female", "male", "male", "female", "female")
print(x)

gender <- factor(x)
print(gender)

is.factor(gender)

# Lists -------------------------------------------------------------------

l1 <- list(c(1, 2, 3), list("Python", "R", "Matlab"), 76, "Inhomogenous")
print(l1)

is.list(l1)

# Accessing elements
l1[2]
l1[[2]][3] # Extracts the third element of the second element
l1[c(1, 3)]
l1[-1]

# Modifying elements
l1[[1]][1] <- 1111
print(l1)

l1[2] <- "changed"
print(l1)

# Creating a list by naming its' components
l2 <- list("ID" = c(1, 2, 3), "Name" = c("Python", "R", "Matlab"))
l2

# Accessing/replacing components of the lists with the dollar sign
l2$Name
l2[2] # Using square brackets still works

l2$Name <- 1000
print(l2)

# Merging two lists
l3 <- c(l1, l2)
print(l3)

# Dataframes --------------------------------------------------------------

df <- data.frame(
  id = c(1:5),
  name = c("Julia", "Ryan", "Kim", "Hanna", "Robert"),
  salary = c(45, 38, 40, 43, 37),
  stringsAsFactors = FALSE
)

print(df)

is.data.frame(df)

# Display the structure of the dataframe
str(df)

# Summary of the data in the dataframe
summary(df)

# Extracting data
df$name
df[1, 2]

# Operators ---------------------------------------------------------------
# Below we are going to cover:
# 1. Arithmetic operators
# 2. Relational operators
# 3. Logical operators

# Arithmetic Operators ---------------------------------------------------------------

vec1 <- c(4, 1)
vec2 <- c(2, 2)

# Examples
cat("Addition of vectors :", vec1 + vec2, "\n")
cat("Subtraction of vectors :", vec1 - vec2, "\n")
cat("Multiplication of vectors :", vec1 * vec2, "\n")
cat("Division of vectors :", vec1 / vec2, "\n")
cat("Modulo of vectors :", vec1 %% vec2, "\n")
cat("Power operator :", vec1^vec2)

# Relational operators ----------------------------------------------------

vec1 <- c(0, 2)
vec2 <- c(2, 3)

# Examples
cat("Vector1 less than Vector2 :", vec1 < vec2, "\n")
cat("Vector1 less than or equal to Vector2 :", vec1 <= vec2, "\n")
cat("Vector1 greater than Vector2 :", vec1 > vec2, "\n")
cat("Vector1 greater than or equal to Vector2 :", vec1 >= vec2, "\n")
cat("Vector1 not equal to Vector2 :", vec1 != vec2, "\n")

# Logical Operators -------------------------------------------------------

vec1 <- c(50, 4.2, 0)
vec2 <- c(TRUE, FALSE, TRUE)

# Remark, non-zero values in R are considered TRUE. Zero is considered FALSE.
# Here comes a demonstration of that fact.
10 & 4.3 # (TRUE & TRUE) returns TRUE
2.5 & 0 # (TRUE & FALSE) returns FALSE

# Examples
cat("Element wise AND :", vec1 & vec2, "\n")
cat("Element wise OR :", vec1 | vec2, "\n")

# To read about the difference between & and &&, check for instance:
# https://stackoverflow.com/questions/6558921/boolean-operators-and
cat("Logical AND :", vec1 && vec2, "\n")
cat("Logical OR :", vec1 || vec2, "\n")

cat("Negation :", !vec2)

# Conditional logic -------------------------------------------------------

# Example code to check whether a number
# is considered "low", "medium" or "high"

x <- 15

if (x < 10) {
  print("low")
} else if (10 <= x && x <= 20) {
  print("medium")
} else {
  print("high")
}

# Built in functions ------------------------------------------------------

# Mathematical functions
numbers <- 1:4
print(numbers)

print(sum(numbers))
print(max(numbers))
print(min(numbers))

print(mean(numbers))
print(median(numbers))
print(range(numbers))

print(exp(numbers))
print(log(numbers))
print(sqrt(numbers))

# String functions
my_string <- "ProGramming is GREAT FuN"
print(my_string)

substr(my_string, start = 1, stop = 11)
toupper(my_string)
tolower(my_string)
nchar(my_string)

# Creating user-defined functions -----------------------------------------

# A simple function
check_even_or_odd <- function(x) {
  if (x %% 2 == 0) {
    return("even")
  } else {
    return("odd")
  }
}

check_even_or_odd(4)
check_even_or_odd(3)

# A user defined function with multiple outputs
rectangle_info <- function(length, width = 4) {
  area <- length * width
  perimeter <- 2 * (length + width)
  result <- list("Area" = area, "Perimeter" = perimeter)
  result
}

rectangle_info(2, 2) # Calling by position
rectangle_info(5) # Using the default value for width
rectangle_info(width = 2, length = 1) # Calling by keyword and changed order of arguments

# Looping -----------------------------------------------------------------

# For loop example 1
for (i in 1:10) {
  print(i)
}

# For loop example 2: index variable called "language" instead of i as above
languages <- list("R", "Python", "Matlab", "SAS", "C", "C++", "C#", "Java")

for (language in languages) {
  print(language)
}

# While loop
i <- 0
while (i < 4) {
  print(i)
  i <- i + 1
}

# Storing values and benchmarking -----------------------------------------

# Approach 1: Appending an empty vector
time1 <- system.time({
  my_results <- c()

  for (i in 1:100000) {
    result <- i^2
    my_results <- c(my_results, result)
  }
})

# Approach 2: Replacing elements in a pre allocated vector
time2 <- system.time({
  my_storage <- integer(100000)

  for (i in 1:100000) {
    result <- i^2
    my_storage[i] <- result
  }
})

# Conclusion: Pre allocating a vector to store values is faster, so use that if possible
print(time1)
print(time2)

# Loading Excel Data ------------------------------------------------------

# install.packages and library commands below are placed here for
# pedagogical reasons, i.e. to clearly see where it is used

# install.packages("readxl")
# library("readxl")

# OBS: You must change the file_path to your own location
file_path <- "C:/Users/Antonio Prgomet/Documents/YouTube/R/introduction_to_r_programming/income_age_education.xlsx"
my_data <- read_excel(file_path)

head(my_data)

boxplot(my_data$income, xlab = "", ylab = "income", main = "Boxplot of Income")

# Plotting ----------------------------------------------------------------

# Check built in datasets
data()

data("mtcars") # Load the "mtcars" dataset

# Looking at the data that we will use
?mtcars
dim(mtcars)
head(mtcars)
summary(mtcars)

# Scatterplot of mpg and hp
plot(mtcars$hp, mtcars$mpg, main = "Scatterplot", xlab = "hp", ylab = "mpg")

# Scatterplot matrix of four variables
pairs(~ wt + mpg + disp + cyl,
  data = mtcars,
  main = "Scatterplot Matrix"
)

# Line plot
x <- seq(-3, 3, length.out = 10)
y <- x^2
plot(x, y, type = "o", col = "blue", main = "y = x^2")

# Some Statistics ---------------------------------------------------------

# Setting seed for reproducability
set.seed(42)

# Simulate normal distributed data
data <- rnorm(1000, mean = 10, sd = 3)

hist(data, col = "green", border = "black")

# Estimating mean and standard deviation from data.
# Since it is simulated, we know the "true answer".
mu <- mean(data)
std <- sd(data)
n <- length(data)

# Calculate a confidence interval, first with builtin function and then manually
ci_builtin <- t.test(data, conf.level = 0.95)
ci_builtin$conf.int

ci_manual <- c(mu - qt(1 - 0.025, n - 1, lower.tail = TRUE) * (std / sqrt(n)), mu + qt(1 - 0.025, n - 1, lower.tail = TRUE) * (std / sqrt(n)))
print(ci_manual)

# Linear Regression -------------------------------------------------------

head(mtcars)

lin_reg <- lm(mpg ~ hp + wt, data = mtcars)
lin_reg

summary(lin_reg)

# Confidence interval for the estimated parameters
confint(lin_reg)

# dplyr - single tables ---------------------------------------------------

# install.packages("dplyr")
# library(dplyr)

# Looking at the data that we will use
?starwars
dim(starwars)
head(starwars)

# Choose rows based on specific column values
starwars %>% filter(skin_color == "light", eye_color == "brown")

# Extracting the same data without using dplyr
starwars[starwars$skin_color == "light" & starwars$eye_color == "brown", ]

# Order the rows with highest height first
starwars %>% arrange(desc(height))

# Create two new columns (height_m and BMI) and place them first
starwars %>%
  mutate(
    height_m = height / 100,
    BMI = mass / (height_m^2)
  ) %>%
  select(height_m, BMI, everything())

# Calculate mean height and mean mass for each unique group of species and sex
starwars %>%
  group_by(species, sex) %>%
  select(height, mass) %>%
  summarise(
    height = mean(height, na.rm = TRUE),
    mass = mean(mass, na.rm = TRUE)
  )

# dplyr - two tables ------------------------------------------------------

# Mutating joins
df1 <- tibble(x = c(1, 2), y = 2:1)
df2 <- tibble(x = c(3, 1), a = 10, b = "a")
print(df1)
print(df2)

# left_join(x, y) includes all observations in x, regardless of whether they match or not
df1 %>% left_join(df2, by = "x")

# inner_join(x, y) only includes observations that match in both x and y
df1 %>% inner_join(df2, by = "x")

# full_join() includes all observations from x and y
df1 %>% full_join(df2, by = "x")


# filtering joins
df3 <- tibble(x = c(1, 1, 3, 4), y = 1:4)
df4 <- tibble(x = c(1, 1, 2), z = c("a", "b", "a"))
print(df3)
print(df4)

# semi_join(x, y) keeps all observations in x that have a match in y
df3 %>% semi_join(df4, by = "x")

# anti_join(x, y) drops all observations in x that have a match in y (filtering join)
df3 %>% anti_join(df4, by = "x")


# Set operations
df5 <- tibble(x = 1:2, y = c(1L, 1L))
df6 <- tibble(x = 1:2, y = 1:2)
print(df5)
print(df6)

# intersect(x, y) return only observations in both x and y
intersect(df5, df6)

# union(x, y) return unique observations in x and y
union(df5, df6)

# setdiff(x, y) return observations in x, but not in y
setdiff(df5, df6)

# ggplot2 -----------------------------------------------------------------

# install.packages("ggplot2")
# library(ggplot2)

# Looking at the data that we will use
?mpg
dim(mpg)
head(mpg)
summary(mpg)

# Creating a simple scatterplot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# Colour the points according to which class the car belongs to
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Make a seperate scatterplot depending on which class the car belongs to
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)

# Displaying multiple geoms in one plot  using global mappings 
# (x = displ, y = hwy) and
# local mapping for geom_point (color = class)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()

# Creating a "horizontal" boxplot by switching the x and y axis
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()
