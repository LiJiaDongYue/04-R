

#1.Base基本绘图系统
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
hist(airquality$Wind, xlab = "wind")
boxplot(airquality$Wind, xlac = "Wind", ylab = "Speed(mph)")
with(airquality, boxplot(Wind ~ Month))
with(airquality,
     plot(
       Wind,
       Temp,
       main = "Wind ang Temp in NYC",
       sub = "atuther:leal",
       type = "n"
     ))
#type=n
with(subset(airquality, Month == 9), points(Wind, Temp, col = "red"))
with(subset(airquality, Month == 5), points(Wind, Temp, col = "blue"))
with(subset(airquality, Month %in% c(6, 7, 8)),
     points(Wind, Temp, col = "green"))
fit <- lm(Temp ~ Wind, airquality)
abline(fit, lwd = 2)
legend(
  "topright",
  pch = 1,
  col = c("red", "blue", "green"),
  legend = c("Sep", "May", "Other")
)

#查看当前全局设置默认值
#mar bottom left top right
par("bg", "col", "mar", "mfrow", "mfcol")

#2 —lattice包
#xyplot/bwplot/histogram/stripplot/dotplot/splom
#格式：xyplot(y~x|f*g,data)
head(airquality)
library(lattice)
xyplot(Temp ~ Ozone, data = airquality)
q <- xyplot(Temp ~ Ozone, data = airquality)
class(q)
#with Month
airquality$Month <- factor(airquality$Month)
xyplot(Temp ~ Ozone | Month, airquality, layout = c(5, 1))

####
set.seed(1)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - x * f + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group1", "Groep2"))
xyplot(x ~ y | f, layout = c(2, 1))
xyplot(y ~ x | f, layout = c(2, 1))
#
xyplot(
  y ~ x | f,
  panel = function(x, y) {
    panel.xyplot(x, y)
    panel.abline(v = mean(x), h = mean(y), lwd = 2)
    panel.lmline(x, y, col = "red")
  }
)

#opar(par)
rm(opar)
#3.ggplot2
head(airquality)
library(ggplot2)
qplot(Wind, Temp, data = airquality, col = Month)#I
qplot(Wind, Temp, data = airquality, col = I("red"))#I
qplot(
  Wind,
  Temp,
  data = airquality,
  size = Month,
  xlab = "M-Wind",
  ylab = "M-Temp",
  main = "Temp of Month in"
)#size
#默认的拟合方法和置信区间
qplot(
  Wind,
  Temp,
  data = airquality,
  col = Month,
  geom = c("point", "smooth"),
  xlab = "M-Wind",
  ylab = "M-Temp",
  main = "Temp of Month in"
)
#facets
qplot(
  Wind,
  Temp,
  data = airquality,
  col = Month,
  facets = . ~ Month,
  xlab = "M-Wind",
  ylab = "M-Temp",
  main = "Temp of Month in"
)

#一个变量，默认为柱状图，fill累加月份
qplot(Wind, data = airquality, fill = Month)
#频率分布轮廓线-密度函数
qplot(Wind,
      data = airquality,
      geom = "density",
      col = Month)
qplot(Wind,
      data = airquality,
      geom = "dotplot",
      col = I("red"))

##ggpolt
#ggplot2绘图系统层（Layer）
#Data 数据层
#Aesthetics 美学 x-axis/y-axis/xolor/fill/size/labels/alpha/shape/linear wifth/linear type
#Geometeries 几何 point/line/histogram/bar/boxplot
#Facets 面 columns/rows
#Statistics 统计层 binning/smoothing/descriptive/interential
#Coordinates 坐标系 certesian/fixed/polar/limits
#Themes 主题 non-data ink
ggplot(airquality, aes(Wind, Temp)) + geom_point(color = "steelblue",
                                                 alpha = 0.4,
                                                 size = 5)
#Aesthetics
ggplot(airquality, aes(Wind, Temp)) + geom_point(aes(col = factor(Month)), alpha =
                                                   0.4, size = 5)
##Geometeries
ggplot(airquality, aes(Wind, Temp)) + geom_point(aes(col = factor(Month))) +
  geom_smooth()#methpd="loess
#
ggplot(airquality,aes(Wind, Temp, col = factor(Month))) + geom_point() + 
  stat_smooth(method = "lm",aes(group=1))+
  stat_smooth(se=FAUSE)

#color 选取包中自定义颜色
library(RColorBrewer)
mycolor <- c(brewer.pal(5,"Dark2"),"black")

display.brewer.pal(5,"Dark2")
ggplot(airquality,aes(Wind, Temp, col = factor(Month))) + geom_point() + 
  stat_smooth(method = "lm", aes(group=1,col="All"))+
  stat_smooth(se = FALSE)+
  scale_alpha_manual("Month",values=mycolor)

#Statistics
display.brewer.pal(5,"Dark2")
ggplot(airquality,aes(Wind, Temp, col = factor(Month))) + geom_point() + 
  stat_smooth(se = FALSE)+
  scale_alpha_manual("Month",values=mycolor)+
  facet_grid(.~Month);

#theme
display.brewer.pal(5,"Dark2")
ggplot(airquality,aes(Wind, Temp, col = factor(Month))) + geom_point() + 
  stat_smooth(se = FALSE)+
  scale_alpha_manual("Month",values=mycolor)+
  facet_grid(.~Month)+
  theme_classic()

#Color in R
#R语言绘图之颜色
#grDevice包：colorRamp()&colorRampPalette()

#两个极端的值，去中间值需要输入0-1之间数值即可
#show rgb
cr <- colorRamp(c("red","blue"))
cr(0)
cr(seq(0,1,len=10))
#show 0x
crp <- colorRampPalette(c("red","yellow"))
crp(1)
crp(10)

#RColorBrewer包
brewer.pal.info
pal <- colorRampPalette(brewer.pal(3,"Greens"))
image(volcano,col = pal(20))

#图形设备Devices
dev.cur()

#use pdf
head(airquality)
pdf(file="mypictus.pdf")
with(airquality,plot(Wind,Temp,xlab = "M-Wind",ylab = "M-Temp",main = "Wind 0f Temp in GTC"))
dev.off()

#png
with(airquality,plot(Wind,Temp,xlab = "M-Wind",ylab = "M-Temp",main = "Wind 0f Temp in GTC"))
dev.copy(png,file="mypng.png")
dev.off()








