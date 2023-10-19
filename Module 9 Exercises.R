#Exercise 9.5.1 Spørgsmål 1:
x <- c(1,2,-3,4)

if(all(x>0)){
  print("All Postives")
} else {
  print("Not all positives")
}

x <- c(FALSE, FALSE, FALSE, FALSE)
all(x)
any(x)
any(!x)
all(!x)
!any(x)


library(tidyverse)
x <- 1:15
x



for (r in x)
  if(x[r] <7) x[r]=0
x


x <- 1:15
if_else(x >= 7, as.integer(x),0)

x <- 1:15
if_else(x >= 7 & x<10, as.integer(x),NA_integer_)



x <- sample(c(1:10,NA,5.5), 1)
x
#> [1] 7



x <- sample(c(1:10,NA,5.5), 1)
x <- 5.5
if (is.na(x)) {
  y <- "missing"
} else if (x%%2 ==0) {
  y <- "even"
} else if (x %% 1 > 0) {
  y <- "decimal"
} else if (x %% 2 != 0) {
  y <- "odd"
} 
x
y


