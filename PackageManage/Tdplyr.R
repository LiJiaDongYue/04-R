# dplyr 高速处理数据，取代R自带的一些函数
library(dplyr)

#Create data
firstname <- c("Bob","Mary","Jane","KIm")
lastname <- c("AS","ererf","dsgff","dfgfd")
weight <- c(43,23,45,64)
height <- c(123,234,154,221)

birth <- c("1992-12","1993-04","1234-324","234-23")
accept <- c("Y","N","Y","N")

data1 <- data.frame(firstname,lastname,weight,height)
rownames(data1) <- letters[1:4]
data2 <- data.frame(data1,birth,accept)

data2[2,3]
data2[c(2,4),c(1,3)]# row col
data2["a","weight"]
data2["a",2]
data2[3]
data2[c(2,3)]

