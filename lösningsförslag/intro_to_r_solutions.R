
# Coding Exercises --------------------------------------------------------

# Explain what the code below does ----------------------------------------
10 %% 3

# -------------------------------------------------------------------------
# Append the empty_vector with all numbers from 1 to 25 that are divisible by 2,
# i.e. the remainder is 0 when divided by 2. 
# -------------------------------------------------------------------------
empty_vector <- c()

for (i in seq(1, 25)){
  if (i %% 2 == 0){
    empty_vector <- c(empty_vector, i)
  }
}

empty_vector

# -------------------------------------------------------------------------
# Write code that compares the variables a and b, 
# if a > b then print the message "a is greater", 
# else print the message "a is smaller"
# -------------------------------------------------------------------------
a <- 10
b <- 100

if (a > b){
  print("a is greater")
} else {
  print("a is smaller")
}

# -------------------------------------------------------------------------
# if a is equal to 7 print "a is 7", if a is equal to 10 print "a is 10",
# else print "a is neither 7 nor 10"
# -------------------------------------------------------------------------
a = 10

if (a == 7) {
    print("a is 7")
} else if (a == 10) {
    print("a is 10")
} else {
    print("a is neither 7 nor 10")
}

# Explain what the code below does ----------------------------------------
a <- 200
b <- 33
c <- 500

if (a > b | a > c){
  print("At least one of the conditions is true")
}

# -------------------------------------------------------------------------
# Print out each number in the vector with:
# (1) a for loop,
# (2) a while loop. 
# -------------------------------------------------------------------------
my_vector = c(4, 2, 1, 10, 3)

for (i in my_vector){
  print(i)
}

i <- 1
while (i <= length(my_vector)){
  print(my_vector[i])
  i = i + 1
}

# -------------------------------------------------------------------------
# Create a function that accepts two arguments and that returns 
# the sum and subtraction of the numbers. 
# -------------------------------------------------------------------------
sum_and_subtract <- function(x, y){
  addition <- x + y
  subtraction <- x - y
  answer <- list("addition" = addition, "subtraction" = subtraction)
  return(answer)
}

sum_and_subtract(10, 4)

sum_and_subtract(10, 4)["addition"]
sum_and_subtract(10, 4)$addition

sum_and_subtract(10, 4)["subtraction"]
sum_and_subtract(10, 4)$subtraction

# -------------------------------------------------------------------------
# Write a function "my_fun" that takes as input "first_name" and "last_name"
# and then prints out the message "Hello first_name last_name, 
# do you like R"? Hint: Use the paste() function. 
# -------------------------------------------------------------------------
my_fun <- function(first_name, last_name){
  paste("Hello", first_name, last_name, ",", "do you like R?")
}
my_fun("Antonio", "Prgomet")

# -------------------------------------------------------------------------
# Plot the function y = x^2 from [-4, 4]. 
# Hint: use the seq() function to generate points. 
# Set an x-label, y-label and a title.
# -------------------------------------------------------------------------
x <- seq(-4, 4, length.out = 10)
y <- x**2

plot(x, y, type ="o", xlab = "x-values", ylab = "y.values", main = "y = x^2")

# Explain the code below --------------------------------------------------
par(mfrow=c(2,2))
x <- rnorm(100, 0, 1)

plot(x)
hist(x)
boxplot(x)


# Explain what the code below does ----------------------------------------

my_data <- data.frame(x = c(15, 2, 7, 4, 5),
                      y = c(33, 4, 1, 8, 10),
                      z = c(3, 6, 9, 12, 15))

sapply(my_data, range)


# This code does not work, explain the problem and solve it. --------------
print('He's name is R, James R.')

# Solution 1. 
print("He's name is R, James R")
# Solution 2. 
print('He\'s name is R, James R')



