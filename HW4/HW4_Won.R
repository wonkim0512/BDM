install.packages('linprog', dependencies = T)
library(linprog)

# Hw4 Q3
cvec <- c(18, 29, 25)
bvec <- c(1500, 600, -1000, -200, -400)
amat <- matrix(c(0.5, 0.2, 0.75, 0.2, 0.4, 0.2, -1, 0, 0, 0,-1, 0, 0, 0, -1), ncol = 3, byrow = T)
amat
solveLP(cvec, bvec, amat, maximum = T)

# Hw4 Q4
cvec <- -c(48000, 29000, 21000, 13000, -14000, -6000, +2000)
bvec <- c(-10, -40, -35)
amat <- matrix(c(20, -1, 0, 0, 1, 0, 0, 20, -1, -1, 0, 1, 1, 0, 20, -1, -1, -1, 1, 1, 1), ncol = 7, byrow = T)
amat
solveLP(cvec, bvec, amat, maximum = T)
