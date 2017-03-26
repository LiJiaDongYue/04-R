
#R语言实战第五章--高级数据管理
#explame5.1
x1 <- c(1:8)
mean(x)
sum(x)/length(x)
sd(x)
var(x)
sum((x-sum(x)/length(x)^2))/(length(x)-1)#方差标准计算方式


x2 <- pretty(c(-3,3),30)
y1 <- dnorm(x2)#密度函数
y2 <- pnorm(x2)#分布函数
y3 <- qnorm(x2)#分位数函数
y4 <- rnorm(x2)#随机数函数
plot(x2,y1,type = "l")
plot(x2,y2,type = "l")
plot(x2,y3,type = "l")
plot(x2,y4,type = "l")




