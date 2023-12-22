z <- c(1, -1, 3)
z > 0
all(z>0)
any(z>0)


#Test output intuition:
x <- c(1, 2, 45, NA, -1)
x > 0 #Returns NA for the 4th value as we dont know.
x > -100
any(x > 0) 
all(x > -100) #Returns NA as NA is in vector. NA means we don't know.


#Parenthesis:
(x == 4 | y != "Lars") & !is.na(z) #returns false
x == 4 | (y != "Lars" & !is.na(z)) #returns true as the first entry in the or statement is true. Then we don't need to check the reamining statements.

#Comparing vectors:
v1 <- 1:4
v2 <- c(2,-1,7,9)
v1 > 1 & v2 < 3 #Applies the operation for each element in the vectors, elementwise. That is, vector has to have same length

#Conditional statements (a single boolean)
x <- 5
if (x < 3) {
  cat("first")
} else if (x > 4) {
  cat("next")
} else {
  cat("last")
}

#While loop - {is what's done in the while loop}
x <- 1
while(x < 5) {
  x <- x + 1
}



#Conditional Statements (vector of booleans)
library(tidyverse)
x <- c(-5:5, NA)

## using if and for
res <- rep("", length(x)) #First we make the vector for which we want to contain our new text
res
#For each entry in x (for the length). If the value is NA then replace with string "missing". If the value <0 then replace with "negative". Else (meaning positive) replace with "positive"
for (i in 1:length(x)) {
  if (is.na(x[i])) res[i] <- "missing"
  else if (x[i] < 0) res[i] <- "negative"
  else res[i] <- "positive"
}
res

#Do the above vectorwise
## using if_else. We can use this if_else statement instead of the above ?if_else.
res <- if_else(x < 0, 
               "negative (true)", 
               "positive (false)", 
               "missing (na)")
res


#Loops (for or while)
v <- c(2,4,9,0)  # values we want to iterate over
res <- rep(NA, length(v)) # vector to store results in
for (idx in 1:length(v)) {
  res[idx] <- 6 * v[idx] + 9 #Here we make use of the current index we are in, and access that value in the v vector.
} #index runs through the length of v. length(v) returns the length, that is, 4. 1:length(v) returns 1, 2, 3, 4 (how many times we want to iterate the)

res   # equal 6*v + 9
#We could also just have written
v <- c(2,4,9,0) 
6 * v + 9

#Summing over a range
x <- 1
res <- x
while(x < 5) {
  x <- x + 1
  res <- res + x 
}
res   # equal sum(1:5). 1+2+3+4+5
#We could also just have written:
sum(1:5)

#cat is used to concatenate.
v <- c(2,4,9,0) 
res <- rep(NA, length(v)) 
for (idx in c("A",2,5) {
  cat(idx)
  }

  
#Worse way of doing vector calculations. We wish to always allocate all of the needed ram/vector length first to not have to do many operations (expanding the vector length each operation) res <- rep(NA, length(v)) 
v <- c(2,4,9,0) 
res <- NULL
for (idx in 1:length(v)) {
  res <- c(res,6*v[idx]+9)
}
res




#Nested loops:
for (i in 1:3) {
  for (j in 1:2) {
    # code here
  }
}


#Replacing nested loops with expandt_grid: Easier when there are many loops
#Expand_grid takes all differnet combinations one could make, with the two nested loops.
library(tidyverse)
ite <- expand_grid(i = 1:3, j = 1:2)
for (r in 1:nrow(ite)) { # iterate over rows
  i <- ite$i[r] #which row we're considering in the dataframe
  j <- ite$j[r]
  # code here
}


#Exercise from lecture: Rolling a dice
dice <- 1:6
card_suit <- c("clubs", "diamonds", "hearts", "spades")
card_number <- c("ace", 2:10, "jack", "queen", "king")
ite <- expand_grid(Dice = dice, 
                   Card_suit = 1:length(card_suit), 
                   Card_number = 1:length(card_number))  
for (r in 1:nrow(ite)) { # Iterate over rows
  cat("Dice = ", ite$Dice[r], " and card = ", card_suit[ite$Card_suit[r]], " (", card_number[ite$Card_number[r]], ").\n", sep = "")
}



#Exercise from lecture: Rolling a dice - a different approach
dice <- 1:6
card_suit <- c("clubs", "diamonds", "hearts", "spades")
card_number <- c("ace", 2:10, "jack", "queen", "king")
ite <- expand_grid(A = dice, 
                   B = card_suit, 
                   C= card_number)  
for (r in 1:nrow(ite)) { # iterate over rows
  a <- ite$A[r]
  b <- ite$B[r]
  c <- ite$C[r]
  cat("Dice = ", a, " and card = ", b, " (", c, ").\n", sep="")
}

#using for loops
for (d in dice) {
  for (n in card_number) {
    for (s in card_suit) {
      cat("Dice = ", d, " and card = ", n, " (", s, ").\n", sep="")
    }
  }
}



