## Base R

# Data types
## Numeric

data1 <- c(1, 2, 3, 4, 5)
data2 <- c(1L, 2L, 3L, 4L, 5L)

class(data1)
typeof(data2)

## Character

data3 <- c("ann", "erick", "", "l")
class(data3)
typeof(data3)

## Factor
data4 <- factor("Primary", "Secondary", "University")
class(data4)

# data5 <- as.factor(data4, labels = c("Primary", "Secondary", "University"),
#                 values = c(1, 2, 3))

# Type conversion
data6 <- as.character(data1)
data7 <- as.numeric(data6)
data8 <- as.numeric(data3)

# date types
data9 <- Sys.time()
data9

data10 <- Sys.Date()
data10

class(data10)
typeof(data10)

data10
data10 - 35


# Objects
## Vectors
data1 <- c(1, 3, 5, 68, 0)
data2 <- 1:10
data3 <- c(1:10, 15, 17, 21)
data4 <- 25:0
data5 <- 0:30
data5a <- 2.5:7.5

data5[25]
data5[26]


data5 * 2

data5 - 10

data5 / 10

data5^5

sqrt(data5)

sqrt(data5[31])

data6 <- seq(from = 1, 
             to = 25, 
             by = 2)
data6

data7 <- seq(from = 1, 
             to = 25, 
             length.out = 50)

data5 <- 0:30
length(data5)


## Data frames
df1 <- data.frame(col1 = c(1, 2, 3, 4, 5),
                  col2 = c("ann", "john", "erick", "james", "june"))


class(df1)
typeof(df1)

df1[2, 2]
df1[4, 2]

df1$col2

df1$col2[5]

df1$col3 <- df1$col1*4
df1$col4 <- df1$col1/3
df1$col5 <- round(df1$col4, signif())
df1$col6 <- signif(df1$col4, 3)


df1[, "col4"]
df1[, 4]


df1[3, ]
df1[, 3]

df1[df1$col3 < 12, ]
df1[df1$col5 == 1, ]
df1[df1$col2 == "john", ]
df1[df1$col6 > 1, ]

# Lists 


# Accessing elements in objects

# Missing data

## Modern R (Packages)

# Importing data



