#Exercise 9.5.1 conditional expression
x <- c(1,2,-3,4)

if(all(x>0)){
  print("All Postives")
} else {
  print("Not all positives")
}

x <- c(TRUE, FALSE, TRUE, TRUE)
all(x)
any(x)
any(!x)
all(!x)

