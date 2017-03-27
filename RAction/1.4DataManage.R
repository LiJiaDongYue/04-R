#基本数据管理
manage <- c(1:5)
date <- c("17/23/02","17/23/03","17/23/04","17/23/05","17/23/06")
country <- c("UK","US","US","UK","US")
gendar <- c("M","F","M","F","M")
age <- c(32,34,23,45,99)
q1 <- as.vector(sample(1:5,5,replace = TRUE))
q2 <- as.vector(sample(1:5,5,replace = TRUE))
q3 <- as.vector(sample(1:5,5,replace = TRUE))
q4 <- c(2,3,4,NA,4)
q5 <- c(3,4,5,NA,6)
leadership <- data.frame(manage,date,country,gendar,age,q1,q2,q3,q4,q5)

leadership$age[leadership$age==99] <- NA
#重编吗
leadership <- within(leadership,{
  agegrade <- 0
  agegrade[age<=18] <- "Young"
  agegrade[age>18&age<=40] <- "Medium"
  agegrade[age>40] <- "Older"
})

library(reshape2)
library(reshape)
leadership <- rename(leadership,c(manage="managerId",date="Tdate"))
#使用na.omit()删除不完整的观测
leadership <- na.omit(leadership)
leadership
as.Date(Sys.Date(),"%Y-%m-%d")

#数据库操作
attach(mtcars)
library(gsubfn)
library(proto)
library(RSQLite)
library(sqldf)
sqldf("SELECT * FROM mtcars WHERE carb=1 ORDER BY mpg",row.names=TRUE)
detach(mtcars)



