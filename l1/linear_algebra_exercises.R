
# Some Linear Algebra in R ------------------------------------------------

# -------------------------------------------------------------------------
# Do the following calculations in the two matrices A and B: 
# (1) Matrix Addition, 
# (2) Elementwise multiplication, 
# (3) Elementwise division, 
# (4) Elementwise exponentiation.
# -------------------------------------------------------------------------
A <- matrix(c(1, 3, 5, 2), nrow = 2, ncol = 2)
B <- array(c(1, 1, 10, 2), dim = c(2, 2))
A
B



# Do Matrix Multiplication on the two matrices below. ---------------------
B = rbind(c(1, 2, 3), c(5, 2, 1))
C = cbind(c(2, 2, 1), c(1, 5, 10))
print(B)
print(C)


# Explain what the code below does. ---------------------------------------
multiarray <- array(c(1:24), dim = c(4, 3, 2))
print(multiarray)


