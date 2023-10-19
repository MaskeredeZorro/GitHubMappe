#Functions
library(tidyverse)
loop_output <- function(dat, rows = 1:2, cols = 2:3, ...) {
  ite <- expand_grid(r = rows, c = cols)
  for (i in 1:nrow(ite)) {
    r <- ite$r[i]
    c <- ite$c[i]
    cat("Row ", r, " column ", c, " = ", dat[r,c], ".\n", ...)
  } 
  return("Finished!")
}

## ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse)


#' Title
#'
#' @param dat A data frame
#' @param rows Rows to loop through
#' @param cols Columns to loop through
#' @param ... Arguments passed to 'cat'
#'
#' @return A string
loop_output <- function(dat, rows = 1:2, cols = 2:3, ...) {
  ite <- expand_grid(r = rows, c = cols)
  for (i in 1:nrow(ite)) {
    r <- ite$r[i]
    c <- ite$c[i]
    cat("Row ", r, " column ", c, " = ", dat[r,c], ".\n", ...)
  } 
  return("Finished!")
}

loop_output(mtcars)  # default values
loop_output(mtcars, rows = c(3,1), cols = 6)  # specify values #Consider row 3 and 1, and column 6, and we want the values of those
loop_output(mtcars, rows = c(3,1), cols = 6, sep = "")  # use the ... argument


## ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Your turn: Create a function that given some dice numbers and some cards from
# a 52-card deck (e.g. 1-spade), write out all the possible combinations as
# strings in the form Dice = [value] and card = [value]. Moreover, if the dice
# numbers contains the number 2, function must return true; otherwise, false.

#' Combinations of dice and card
#'
#' @param dice Dice numbers
#' @param card Cards used
#'
#' @return TRUE if dice contains a 2; FALSE otherwise
get_combinations <- function(dice, card) {
  ite <- expand_grid(d = dice, c = card)
  found <- FALSE
  for (i in 1:nrow(ite)) {
    d <- ite$d[i]
    c <- ite$c[i]
    cat ("Dice = ", d, " and Card = ", c, ".\n", sep="")
    if (d==2) found = TRUE
  } 
  return(found)
}
get_combinations(dice = c(2,3), card = c("2-spade", "ace-dimond"))
get_combinations(dice = c(3,1), card = c("10-heart", "king-dimond"))


#You can make your own package and attach documentation to it by using the exoskeleton.


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Your turn: 
# - Create a function that calculates the present value (PV) of a future value. The equation is: 
#   $$PV = FV/(1+r)^n$$ where $FV$ is future value, $r$ is the interest rate, and $n$ is the number of periods. 
# - Input arguments must be $FV$, $r$, $n$ and a boolean `round` equal true if the output should be rounded to two decimals. 
# - The default interest rate is 0.1 (10%) and rounding is false by default.

#' Calculate the present value
#'
#' @param FV Future value.
#' @param r Interest rate.
#' @param n Number of periods.
#' @param rond TRUE if round the output to 2 decimals.
#'
#' @return Present value
get_PV <- function(FV, r=0.1, n, round = FALSE) {
  if (round == TRUE) {
    round(FV/(1+r)^n, 2)}
  else FV/(1+r)^n
}
get_PV(100, n = 7)
get_PV(100, n = 7, round = TRUE)
res <- get_PV(100, n = 7, r = 0.5)
res


