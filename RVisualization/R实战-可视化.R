
#input from key
mydata <- data.frame(a=numeric(),b=character());
##1
mydata <- edit(mydata)
##2
mydata <- fix(mydata)

#grathic
pdf("result.pdf")# save as pdf
attach(mtcars)
head(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression 0f MPG ON Weight")
detach(mtcars)
dev.off()

par(no.readonly = T)#生成一个可以修改的当前图形参数列表
dose <- c(20,30,40,50,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
data.drug <- data.frame(dose=dose,drugA=drugA,drugB=drugB)
opar <- par(no.readonly = T)
par(pin=c(2,3))#size
par(lwd=2,cex=1.5)
par(cex.axis=.75,font.axis=3)#font
lines(dose,drugB,type = "b",pch=17,lty=2,col="blue")
abline(h = c(30),lwd=1.5,lty=2,col="gray")
library(Hmisc)
minor.tick(nx=3,ny=3,tick.ratio=0.5)#添加次要刻度线
legend("topleft",inset = 0.05,title = "Drug TYpe",c("A","B"),lty = c(1,2),pch = c(15,17),col = c("red","blue"))
#par(xlab="dose",ylab="druaB")
plot(data.drug$dose,data.drug$drugA,type = "b",pch=19,lty=2,col="red")
plot(data.drug$dose,data.drug$drugB,type = "b",xlab="dose",ylab="druaB",main = "DOSE&DRUUB COMPARE",
     sub = "author:Leal", pch=23,lty=6,col="blue",bg="green")
par(opar)

#1=下,2=左,3=上,4=右
#生成数据
x <- c(1:10)
y <- x
z <- 10/x
opar <- par(no.readonly = TRUE)
par(mar=c(5,4,4,8)+0.01)#增加边界大小
plot(x,y,type = "b",pch=21,col="red",yaxt="n",lty=3,ann = FALSE)#绘制 x 对 y 的图形
lines(x,z,type = "b",pch=22,col="blue",lty=2)#添加 x 对1/ x 的直线
#绘制你自己的坐标轴
axis(2,at = x,labels = x,col.axis="red",las=2)
axis(4,at = z,labels = round(z,digits = 2),col.axis="blue",las=2,cex.axis=0.7,tick = -.01)
mtext("y=1/x",side = 4,line = 3,cex.lab=1,las=2,col = "blue")#添加标题和文本
title("An example",xlab = "x values",ylab = "y=x")
par(opar)

#text&mtext
attach(mtcars)
plot(wt,mpg,main = "Milege vs Car.Weight",xlab = "Weight",ylab = "Milege",pch=18,col="blue")
text(wt,mpg,row.names(mtcars),cex = 0.6,pos = 4,col = "red")
detach(mtcars)

#函数 par() 或 layout() 可以容易地组合多幅图形
attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2))
plot(wt,mpg,main = "wt~mpg")
plot(wt,disp,main = "wt~disp")
hist(wt,main = "hist of wt")
boxplot(wt,main="boxplot oc wt")
par(opar)
detach(mtcars)

#way 2
#widths = 各列宽度值组成的一个向量
#heights = 各行高度值组成的一个向量
#精确地控制每幅图形的大小
attach(mtcars)
opar <- par(no.readonly = TRUE)
#par(mfrow=c(3,1))
layout(matrix(c(1,1,2,3),2,2,byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

#多幅图形布局的精细控制
opar <- par(no.readonly = TRUE)
par(flg=c(0,0.8,0,0.8))#设置散点图
plot(mtcars$wt,mtcars$mpg,xlab = "Miles per Gallon",ylab = "Car Weight")
par(fig=c(0,0.8,0.55,1),new=TRUE)
boxplot(mtcars$wt,horizontal = TRUE,axes=FALSE)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$wt,axes=FALSE)
mtext("Enhanced Scatterplot",side = 3,outer = TRUE,line = -3)
par(opar)

#






