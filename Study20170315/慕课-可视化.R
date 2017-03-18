
#基本绘图系统
#数值变量：
#均值mean/中位数medium/众数/方差var/四分位距（箱图）
#一个数值变量：柱状图/点图/箱图
#两个数值变量：散点图
#分类变量的特征和可视化
#一个分类变量：频率表（frequency table）、条形图（bar plot）
#两个分类变量的关系
#—关联表（continggency table）、相对频率表（relative frequencies）
#—分段条形图、相对频率分段条形图
#—马赛克图（mosaicplot）
#一个分类变量、一个数值变量的关系
#——并排箱图（side-by-side box plot）
summary(airquality$Month)
hist(airquality$Wind,xlab = "wind")
boxplot(airquality$Wind,xlac="Wind",ylab="Speed(mph)")
with(airquality,boxplot(Wind~Month))
with(airquality,plot(Wind,Temp,main = "Wind ang Temp in NYC",sub = "atuther:leal",type="n"))
#type=n
with(subset(airquality,Month==9),points(Wind,Temp,col="red"))
with(subset(airquality,Month==5),points(Wind,Temp,col="blue"))
with(subset(airquality,Month %in% c(6,7,8)),points(Wind,Temp,col="green"))
fit <- lm(Temp~Wind,airquality)
abline(fit,lwd=2)
legend("topright",pch = 1,col = c("red","blue","green"),legend = c("Sep","May","Other"))








