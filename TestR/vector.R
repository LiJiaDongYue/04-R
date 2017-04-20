#2016-02-10
#Study Vector
#imooc
#空向量
x<- vector("character",length = 10)
x1<-1:4
x2<-c(1,2,3,4)
#取元素
x2[1]
#隐式转换
x3<-c(TRUE,10,"A")
#强制转换
x4 <- c("a", "b", "c")
as.numeric(x4) / as.logical() / as.character()
names(x1) <- c("a", "b", "c", "d")

#Matrix & Array
x<-matrix(1:6,nrow = 3,ncol = 2)
dim(x) #维度
attributes(x)#属性
#利用维度创建
y<-1:6
dim(y)<-c(2,3)
#矩阵拼接行列数必须相等
y1<-matrix(5:10,nrow = 3,ncol = 2)
cbind(y1,x) #列绑定
rbind(x,y1) #行绑定


#array
x <- array(1:24, dim = c(4, 6))
x1 <- array(1:24, dim = c(2, 3, 4))

#list
l <- list(id = "a", 2, 10L, TRUE, 2 + 3i)
x[1] / x["id"] / x[[1]] / x$id
#列表的不完全匹配 在对于长的列表名称可以匹配前面几个字符
l1<-list(id=list(1,2,3,4),b=c("MON","TUR"))
l1[[1]][[2]]
#factor 因子
x <-factor(c("f","f","m","m","f")) #levels 因子水平

table(x)#查看因子
unclass(x)#去掉因子

#缺省值 NA/NaN  (NA包含NaN)
#判断是否有缺失值 is.na()/is.nan()
x<- c(1,NA,2,NA,3)
is.na(x)
is.nan(x)

#data frame
df <- data.frame(id=c(1,2,3,4),name=c("a","b","c","d"),
                 garder=c(TRUE,FALSE,TRUE,FALSE))

#date & time
x <- Date()#字符型
x2 <- Sys.Date()#Date型
x3 <- as.Date("2016-01-01")#创建Date型
x5 <- "Jan 1,2015 02:01"
strptime(x5,"%B %d,%Y %H:%M")
#POSIXct

#missing value deal
m1<-c(1,NA,2,NA,3,4,5)
m1[!is.na(m1)]
m2<-c(NA,3,4,5,2,3,3)
m1[complete.cases(m1,m2)]
#真实分析数据集处理 dataset
library(datasets)
head(airquality)
#处理得到每一行不包含缺失值的内容
g<-complete.cases(airquality)
airquality[g,][1:10,]#查看前十列

#函数使用
x<-list(a=1:10,b=c(11,21,31,41,51))
lapply(x,mean)
sapply(x,mean)#简化lapply的结果
#lapply
xl<- 1:4 #非列表会自动转换为列表
lapply(xl,runif)

#apply
x<-matrix(1:16,4,4)
apply(x,2,mean) #row[col]Sums[Means](x)
apply(x,2,sum)

#split
x <- c(rnorm(5),runif(5),rnorm(5,1))
f <- gl(3,5)
lapply(split(x,f),mean)
#aplit 用于分组 示例
head(airquality)
s <- split(airquality,airquality$Month)#按月进行分组
table(airquality$Month)#查看数据分组记录数
lapply(s,function(x)colMeans(x[,c("Ozone","Wind","Temp")]))#对各列求平均值
sapply(s,function(x)colMeans(x[,c("Ozone","Wind","Temp")],na.rm = TRUE))#格式化 并去掉NA

#排序 Sort & Order
x <-data.frame(v1=1:5,v2=c(10,2,6,9,3),v3=11:15,v4=c(1,1,2,2,1))
sort(x$v2)#返回值
sort(x$v2,decreasing = TRUE)
order(x$v2)#返回排序下标
x[order(x$v2),]
x[order(x$v4,x$v2),]#多个排序指标

#summarize data
head(airquality)#默认前六行 10
tail(airquality)
summary(airquality)
str(airquality)
table(airquality$Ozone,useNA = "ifany")
any(is.na(airquality$Ozone))#判断是否有缺失值
sum(is.na(airquality$Ozone))#缺失值的个数
#示例
head(Titanic)
titaic <- as.data.frame(Titanic)
head(titaic)
dim(titaic)
summary(titaic)
x <- xtabs(Freq~ Class+Age,data=titaic)#交叉表
object.size(airquality)#查看数据的大小，以防止数据溢出
print(object.size(airquality),units = "Kb")
