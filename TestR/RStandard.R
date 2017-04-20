#概率分布
#t分布的双侧p值
2*pt(-2.43,df=13)
#F(2,7)分布上的1%的分位数
qf(0.99,2,7)

#检验分布
attach(faithful)
head(eruptions)
summary(eruptions)#
fivenum(eruptions)#检验五个数的概要
stem(eruptions)
hist(eruptions)#绘制箱线图
hist(eruptions,seq(1.6,5.2,0.2),prob=TRUE) #让翔距缩小，绘制密度图
line(density(eruptions,bw=0.1))
rug(eruptions)#显示实际的点
#ecdf经验累计分布
plot(ecdf(eruptions),do.points=FALSE,verticals = TRUE)
#拟合正态分布
long <- eruptions[eruptions>3]
plot(ecdf(long),do.points=FALSE,verticals=TRUE)
x<-seq(3,5.4,0.01)
lines(x,pnorm(x,mean = mean(long),sd=sqrt(var(long))),lty=3)
#分位比较图 QQ
par(pty="s")#设置方形区域
qqnorm(long);
qqline(long)