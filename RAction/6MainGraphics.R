
#1.条形图
library(grid)
library(vcd)
head(Arthritis)
summary(Arthritis)
#基本条形图
counts <- table(Arthritis$Improved)
barplot(counts,main = "Simple Barplot",xlab = "Improvement",ylab = "Frequency")
#水平
barplot(counts,main = "Simple Barplot",xlab = "Improvement",ylab = "Frequency",horiz = TRUE)
plot(Arthritis$Improved)
#堆砌和分组
counts <- table(Arthritis$Improved,Arthritis$Treatment)
barplot(counts,col=c("red","yellow","green"),legend=(rownames(counts)))
#分组
barplot(counts,col=c("red","yellow","green"),legend=(rownames(counts)),beside = TRUE)
#均值条形图
states <- data.frame(state.region,state.x77)
means <- aggregate(states$Illiteracy,by=list(state.region),FUN=mean)
means <- means[order(means$x),]
barplot(means$x,names.arg = means$Group.1)
#棘状图
attach(Arthritis)
counts <- table(Treatment,Improved)
spine(counts)
detach(Arthritis)

#2.饼形图
par(mfrow=c(2,2))
slice <- c(10,12,4,16,8)
libs <- c("US","UK","Australia","Germany","France") #too large
pie(slice,labels = libs)
#添加比例值
pct <- round(slice/sum(slice)*100)
libs2 <- paste(libs," ",pct,"%",seq="")
pie(slice,labels = libs2,col = rainbow(length(libs2)))

library(plotrix)
pie3D(slice,labels = libs,explode = 0.1)
#从表格创建饼图
mytable <- table(state.region)
libs3 <- paste(names(mytable),"\n",mytable,sep = "")
pie(mytable,labels = libs3)
#扇形图
fan.plot(slice,labels = libs)

#3.直方图
par(mfrow=c(2,2))
#简单直方图
hist(mtcars$mpg)
#制定组数和颜色
hist(mtcars$mpg,freq = FALSE,breaks = 12,col = "red")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg),col="blue",lwd=2)

x <- mtcars$mpg
h <- hist(x,breaks = 12,col = "red")
xfit <- seq(min(x),max(x),length=40)
yfit <- dnorm(xfit,mean = mean(x),sd = sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit,yfit,col="blue",lwd=2)
box()





