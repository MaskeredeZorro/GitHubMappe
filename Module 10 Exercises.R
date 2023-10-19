#Exercise 10.8.1 Spørgsmål 1:
#' Computes the sum of the integers from 1 to n (inclusive).
#'
#' @param n Max value in the sum.
#'
#' @return Sum of the integers from 1 to n.
#'
#' @examples
#' sum_n(30)
sum_n <- function(n) {
  for (i in 1:n)
    n <- n+i^2
  return(n)
}
sum_n(20)


#Exercise 10.8.1 Spørgsmål 2:
compute_s_n <- function(n) {
  for (i in 1:n) {
    n <- n+i^2
    if(i==10) print(n)
  }
  return(n)
}
compute_s_n(20)



#Exercise 10.8.1 Spørgsmål 3:
sum_sn <- function(n) {
  s_n <- vector("numeric", 25)
  for (i in 1:length(s_n)) {
    s_n[i] <- i*(i+1)*(2*i+1)/6
  }
  return(s_n)
}
sum_sn(25)


#Exercise 10.8.1 Spørgsmål 4:
biggest <- function(x,y) {
  if (x>y) {
    return(1)}
  else 0
}
biggest(2,1)

#Exercise 10.8.1 Spørgsmål 5:
freightcost <- function(cost) {
  return(0.1*cost)
}
freightcost(100)


#Exercise 10.8.1 Spørgsmål 6:
freightcostd <- function(cost,fc=0.1) {
  return(fc*cost)
}
freightcostd(0.2,100)



#Exercise 10.8.1 Spørgsmål 7:
freightcostdf <- function(cost) {
  
  return(freightcost(cost)*0.5)
}
freightcostdf(450)


#Exercise 10.8.1 Spørgsmål 8:
freightcostdf <- function(cost) {
  return(freightcostd(cost)*0.5)
}
freightcostdf(450)



#Exercise 10.8.1 Spørgsmål 9:
costs <- function(cost) {
  cost2 <- cost
  freight_cost <- freightcost(cost)
  freight_cost_df <- freightcostdf(cost)
  return(list(total = cost2, shipping = freight_cost, gasolin = freight_cost_df))
}
costs(450)






#Exercise 10.8.2 Spørgsmål 1:
euclidean <- function(p1, p2, q1, q2) {
  return(sqrt((p1-q1)^2+(p2-q2)^2))
}
euclidean(0,10,7,16)


#Exercise 10.8.2 Spørgsmål 2:
p_matfunktion <- function(p_mat, from = 1:nrow(p_mat), to = 1:nrow(p_mat)) {
  d_mat = matrix(NA,nrow=nrow(p_mat),ncol=nrow(p_mat))
  ite <- expand_grid(nrow = from, ncol = to)
  for (r in 1:nrow(ite)) {
    i <- ite$nrow[r]
    j <- ite$ncol[r]
    d_mat[i,j] <- sqrt((p_mat[i,1] - p_mat[j,1])^2 + (p_mat[i,2] - p_mat[j,2])^2)
  }
  return(d_mat)
}

p_mat <- matrix(c(0, 7, 8, 2, 10, 16, 8, 12), nrow = 4)
p_matfunktion(p_mat)




#Exercise 10.8.2 Spørgsmål 3:
library(tidyverse)
calc_distances <- function(p_mat, from = 1:nrow(p_mat), to = 1:nrow(p_mat)) {
  d_mat <- matrix(NA, nrow = nrow(p_mat), ncol = nrow(p_mat))
  ite <- expand_grid(from = from, to = to)
  for (r in 1:nrow(ite)) {
    i <- ite$from[r]
    j <- ite$to[r]
    if (!is.na(d_mat[i,j])) next          # value already calculated 
    if (i==j) {d_mat[i,j] <- 0; next}
    d_mat[i,j] <- sqrt((p_mat[i,1] - p_mat[j,1])^2 + (p_mat[i,2] - p_mat[j,2])^2)
  }
  return(d_mat)
}
p_mat <- matrix(c(10, 9, 15, 15, 11, 19, 12, 11, 7, 15), nrow = 5)
calc_distances(p_mat)
calc_distances(p_mat, to = 3:4)
