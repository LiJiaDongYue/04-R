
#tapply
state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas",
           "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa",
           "sa", "act", "nsw", "vic", "vic", "act")
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
             61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
             59, 46, 58, 43)
statef <- factor(state)
tapply(incomes, statef, mean)
#apply tapply mapply rapply eapply lapply

#计算任何给定向量的标准误
stderr <- function(x) sqrt(var(x)/length(x))
tapply(incomes, statef, stderr)

#模型(Ricker 模型)的定义如下:
#Nt+1 = Nt*exp[r(1-Nt/K)]
ricker <- function(nzero, r, K=1, time=100, from=0, to=time) {
  N <- numeric(time+1)
  N[1] <- nzero
  for (i in 1:time) N[i+1] <- N[i]*exp(r*(1 - N[i]/K))
  Time <- 0:time
  plot(Time, N, type="l", xlim=c(from, to))
}
layout(matrix(1:3, 3, 1))
ricker(0.1, 1); title("r = 1")
ricker(0.1, 2); title("r = 2")
ricker(0.1, 3); title("r = 3")

#方 差 分 析
data("InsectSprays")#六种杀虫剂将会在田野中进行效价测试, 观测变量是昆虫的个数 12Test
summary(InsectSprays)
aov.spray <- aov(sqrt(count) ~ spray, data = InsectSprays)#对数据进行平方根转换
summary(aov.spray)
#chart
opar <- par()
par(mfcol = c(2, 2))#图形界面分成四部分
plot(aov.spray)
par(opar)
termplot(aov.spray, se=TRUE, partial.resid=TRUE, rug=TRUE)

#设备划分为4个相等的部分
layout(matrix(1:4, 2, 2))
layout.show(4)

x <- rnorm(10)
y <- rnorm(10)
plot(x,y)
plot(x, y, xlab="Ten random values", ylab="Ten other values",
     xlim=c(-2, 2), ylim=c(-2, 2), pch=22, col="red",
     bg="yellow", bty="l", tcl=0.4,
     main="How to customize a plot with R", las=1, cex=1.5)

layout(matrix(c(1,1,1,
                2,3,4,
                2,3,4),nr=3,byrow=T))
hist(rnorm(25),col = "VioletRed" )
hist(rnorm(25),col = "VioletRed" )
hist(rnorm(25),col = "VioletRed" )
hist(rnorm(25),col = "VioletRed" )