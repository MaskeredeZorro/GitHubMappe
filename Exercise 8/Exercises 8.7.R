#Exercises 8:


#Exercises 8.7.2: Piping
install.packages("swirl")
library(tidyverse)

#Spørgsmål 1:
head(mtcars)
mtcars
mtcars %>% select(cyl, gear, hp, mpg)

#Spørgmsål 2:
mtcars %>% select(cyl, gear, hp, mpg) %>% filter(mpg<20 & gear==4)

#Spørgmsål 3:
mtcars %>% select(cyl, gear, hp, mpg) %>% filter(mpg<20 | gear==4)


#Spørgsmål 4:

mtcars %>% filter(mpg<20 & gear==4) %>% select(wt, hp, mpg, gear)


#Spørgsmål 5:
mtcars
select((filter((select(mtcars, cyl, gear, hp, mpg, wt)),mpg<20 & gear == 4)),wt, hp)




#Exercises 8.7.3: Setting working dir
library(tidyverse)
setwd("/Users/alexanderstrarup/Library/CloudStorage/OneDrive-Aarhusuniversitet/Skrivebord/Kandidat/1. Semester/TFA/R")
dir.create("subfolder", showWarnings = FALSE) 
write_file("Some text in a file", file = "test1.txt")
write_file("Some other text in a file", file = "subfolder/test2.txt")
read_file("test1.txt")
read_file("subfolder/test2.txt")

setwd("/Users/alexanderstrarup/Library/CloudStorage/OneDrive-Aarhusuniversitet/Skrivebord/Kandidat/1. Semester/TFA/R/Subfolder")
list.files()
read_file("test2.txt")
read_file("../test1.txt")


#Exercise 8.7.4: Vectors
set.seed(200)
v <- sample.int(100,30)
v <- 
sum(v)
mean(v)
sd(v)
v[c(1,6,4,15)]
v
v[v>50]
v[v>75 | v<=25]
v[v==43]
v[is.na(v)]
which(v>75 | v<=25)
sum(v[c(1,6,4,15)])





#Exercise 8.7.5: Matrices
m1 <- matrix(c(37, 8, 51, NA, 50, 97, 86, NA, 84, 46, 17, 62L), nrow = 3) #default=FALSE hvilket betyder, at den fylde hver kolonne op først og derefter går videre til næste kolonne.
m2 <- matrix(c(37, 8, 51, NA, 50, 97, 86, NA, 84, 46, 17, 62L), nrow = 3, byrow = TRUE) #TRUE betyder at den fylder hver række op først og derefter går videre til næste række
m3 <- matrix(c(37, 8, 51, NA, 50, 97, 86, NA, 84, 46, 17, 62L), ncol = 3) #default=FALSE


#Spørgsmål 2:
m1
rowSums(m1, na.rm=TRUE)
colSums(m2, na.rm=TRUE)

#Spørgsmål 3:
m1
m1 <- rbind(m1, c(1,2,3,4))
m1
#Spørgsmål 4:
m1 <- rbind(c(1,2,3,4), m1)
m1

#Spørgsmål 5:
m3
m3 <- cbind(m3, c(1,2,3,4))
m3

#Spørgsmål 6:

m1[2,4] #Select specific entry in matrix

#Spørgsmål 7:
m1[2:3,1:2] #Select range in matrix


#Spørgsmål 8:
m1[3,c(1,3,4)]

#Spørgsmål 9:
m1[3,]

#Spørgsmål 10: Select all NA values
m2[is.na(m2)]

library(tidyverse)
library(dplyr)

#Spørgsmål 11: Select all values in m2 > 50 men uden NA values
m2[!is.na(m2) & m2>50]




#Exercise 8.7.6: Data framces
str(mtcars)
glimpse(mtcars)
?mtcars
mtcars

#Spørgsmål 1: Få opsummering af data
head(mtcars)
tail(mtcars)

#Spørgmsål 2: Undersøg kolonne vha. 3 metoder
mtcars[,4]
mtcars[,"hp"]
mtcars$hp

#Spørgsmål 3: Add row and name the added row
mtcars<-rbind(mtcars,c(34, 3, 87, 112, 4.5, 1.515, 167, 1, 1, 5, 3))
rownames (mtcars)[nrow(mtcars)] <- "Phantom XE"
mtcars


#Spørgsmål 4: Adding column and find the class of the column
col <- c(NA, "green", "blue", "red", NA, "blue", "green", "blue", "red", "red", 
         "blue", "green", "blue", "blue", "green", "red", "red", NA, NA, "red", 
         "green", "red", "red", NA, "green", NA, "blue", "green", "green", 
         "red", "green", "blue", NA)
mtcars <- cbind(mtcars, col)
mtcars
class(mtcars[,"col"])
class(mtcars[,12])
class(mtcars$col)



#Spørgsmål 5: Select V shaped engine
mtcars[mtcars[,2]==2]



#Exercise 8.7.7:
lst <- list(45, "Lars", TRUE, 80.5)
lst

x <- lst[2]
x
#> [[1]]
#> [1] "Lars"
y <- lst[[2]]
y
#> [1] "Lars"


#Spørgsmål 1: What is the class? List class vs character class
class(x)
class(y)


#Spørgmsål 2: Add name to list
names(lst) <- c("age","name","male","weight")
lst

#Spørgsmål 3: Extract name component using $
lst$name

#Spørgsmål 4: Extract the last name:
lst$height <- 173  # add component
lst$name <- list(first = "Lars", last = "Nielsen")  # change the name component
lst$male <- NULL   # remove male component
lst



#Exercise 8.7.8: String Management
str1 <- "Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business."

str2 <- 'BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value.'

str3 <- c(str1, str2)  # vector of strings
str3

str4 <- str_c(str1, 
              str2, 
              "As a process it can be characterized by descriptive, predictive, and prescriptive model building using data sources.",
              sep = " ")   # join strings
str4
#> [1] "Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value. As a process it can be characterized by descriptive, predictive, and prescriptive model building using data sources."
str_c(str3, collapse = " ")    # collapse vector to a string
#> [1] "Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value."

str_replace(str2, "BA", "Business Analytics")  # replace first occurrence
#> [1] "Business Analytics can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value."
str_replace_all(str2, "the", "a")              # replace all occurrences
#> [1] "BA can both be seen as a complete decision making process for solving a business problem or as a set of methodologies that enable a creation of business value."

str_remove(str1, " for making better decisions in business")
#> [1] "Business Analytics (BA) refers to the scientific process of transforming data into insight."

str_detect(str2, "BA")  # detect a pattern
#> [1] TRUE




#Spørgsmål 1: In string searching
str_detect(str1,"Business")
str_detect(str, "Business")

#Spørgsmål 2: Replace BA with Business Analytics
str_replace(str2, "BA", "Business Analytics")


#Spørgsmål 3: Remove "or as a set of methodologies that enable the creation of business value"
str2<-str_remove(str2,"or as a set of methodologies that enable the creation of business value")
str2


#Spørgsmål 4: Add string to string
str2<-str_c(str2, " This course will focus on programming and descriptive analytics.")


#Spørgsmål 5: Replace analytics with business analytics
str_replace(str2, "analytics","business analytics")


#Spørgsmål 6: Do it all with pipes
str2 %>% str_replace("BA", "Business Analytics") %>% str_remove("or as a set of methodologies that enable the creation of business value") %>% str_c(" This course will focus on programming and descriptive analytics.") %>% str_replace("analytics","business analytics")







