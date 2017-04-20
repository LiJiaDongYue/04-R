
#Test
plot(y1~x1,data=anscombe)#画出 y1,x1 的散布图 
lmfit <- lm(y1~x1,data = anscombe)#指定对象
abline(lmfit,col="red")#加上直线(y=ax+b) 
#对数据进行线性拟合
lm(y1~x1,data = anscombe)

#保存对象变量 
#save(x, y, file="xyvar.rda")
#保存整个 Workspace
save.image()
#history
savehistory(file = "t.Rhistory")#use save  loadhistory()
exp(1)#列出自然數 e 的值
trunc(234.234)#直接取整数
factorial(5)#返回x 的阶乘
#Test
#round(x, digits = 0)
#signif(x, digits = 6)
x <- -345.678
round(x)#-346 
signif(x)
#bmi
bmi <- function(w,h){
  round(w/(h/100)^2,digits = 2)
}
#Inf/NaN/NA
#1.无穷大和无穷小与数字运算都返回Inf/-Inf,互相运算返回NaN
#2.与NaN运算返回NaN,与NA运算返回NA
#3.NaN与NA运算返回NaN
#.NA包含NaN

c1 <- c(2,5,3,7,8,9)
diff(c1)
sd(c1)#样本标准偏差
var(c1)#样本变异数
mean(c1)
c1[-2]
c2 <- c(3,7,9,2,5,3)
max(c2)

letters[c(10,18)]
letters[10:18]
LETTERS[21:26]
head(letters)
tail(LETTERS)

#which
x <- 1:10
which(x>3)
x[x>3]
#order not same
x[x>8|x<=6]
x[c(which(x>8),which(x<=6))]

ball <- c(12,3,8,2,9,4,15,5,7,2,12,3)
scoresf <- ball*c(2,3)
sum(scoresf)
mean(scoresf)

#operate islands
islands
newislands <- sort(islands,decreasing = T)
small10.islands <- names(sort(islands)[1:10])
tail(newislands,10)
sort(islands)[c(30,35)]# 30,35

monthday <- c(31,28,31,30,31,30,31,31,30,31,30,31)
names(monthday) <-month.name 
names(monthday[monthday==30])

head(newislands,15)
names(sort(islands)[1:15])# last 15
names(sort(islands,decreasing = T)[1:15])#first 15
order(islands)#get sort nums
islands[which(order(islands)%%2==1)]#odd number
islands[which(order(islands)%%2==0)]#even number
###
newislands[seq(1,48,by=2)]
newislands[seq(2,48,by=2)]

#Matrix 默认按列优先原则 byrow=F
#R使用负索引, 排除负索引所指的行或列
#使用负索引取得矩阵部分元素时，
#如果取得的部分元素剩一行或一列，则 R 语言将自动降低维度，从矩阵变成向量
#drop = FALSE
#矩阵内积，特殊矩阵相乘符号”%/%
#det( )计算矩阵行列式值 must be a square matrix
m <- matrix(1:30,nrow = 5,ncol = 6)
str(m)
m[3:4,]
m[2,3:4]
m[3:4,4:5]

x1 <- c(10,12,14)
x2 <- c(7,14,5)
x3 <- c(15,3,19)
A1 <- rbind(x1,x2,x3)
A2 <- cbind(x1,x2,x3)
A1[1:2,]
A2[1:2,2:3]
A2[,-2]

#scoresf Matrix
subject <- c('Chinese','English','Math','Sociology','Science')
student <- c('T001','T002')
scoresf <- matrix(c(80,76,50,65,89,75,78,88,80,66),nrow = 2,byrow = T)
colnames(scoresf) <- subject
rownames(scoresf) <- student
rowSums(scoresf)
rowMeans(scoresf)
colSums(scoresf)
colMeans(scoresf)[[2]]

#Factor
temperature <- factor(c(28,32,30,34,32,34))
as.character(temperature)
as.numeric(temperature)
#ordered( ) 函数  auto switch factor
size <- c("small","large","med","large","small","large")
size.factor <- factor(size,levels=c("small","med","large"),ordered=TRUE)
table(size.factor)

regin <- factor(state.region,levels=c("Northeast","South", "North Central", "West"),labels=c("NE","SE","NC","W"))
table(regin)
state.name[state.region=="West"]

#blood ordered

#scoresf ordered
scoresfa <- c("A","B","A","A","C","B","B","B","D","F","D","F","A","A","B","C","C","A","B","F")
scores.factor <- ordered(scoresfa)
scores.factor[which(scores.factor>'B')]
scores.factor[which(scores.factor=='F')]
table(scores.factor)

#dataframe
#stringsAsFactors = FALSE 保持字符串类别
scores.frame <- as.data.frame(scoresf)
t(scores.frame)

A1f <- data.frame(name=c("lidan","leal","jack"),gender=c("F","M","M"),height=c(158,170,167),stringsAsFactors = F)
addf <- c("we","F","174")
rbind(A1f,addf)
A2f <- data.frame(name=c("john","dino","tia"),gender=c("F","M","M"),height=c(158,170,167),stringsAsFactors = F)
A3F <- rbind(A1f,A2f)
A3F[A3F$height>=170,]
weighta <- c(80,34,54,234,45,234)
A3F$weight <- weighta
A3F[A3F$gender=='F'&A3F$weight>70,]

#MAJIANG
season <- c("spring","summer","autumn","winter")
color <- c("plum blossoms","orchid","bamboo","chrysanthemum")
chars <- rep(c("zhong","fa","men"),each=4,times=1)
wan <- rep(paste(1:9,"wan",seq=''),each=4,times=1)
tiao <- rep(paste(1:9,"tiao",seq=''),each=4,times=1)
tong <- rep(paste(1:9,"tong",seq=''),each=4,times=1)
#paste
majiang <- list(season,color,chars,wan,tiao,tong)
names(majiang) <- c("season","color","chars","wan","tiao","tong")

#林书豪2016 五场比赛数据
Date <- c("11月3日","11月1日","10月30日","10月29日","10月27日")
Team <- c("A","B","C","D","E")
Time.PTS <- data.frame(Times=c(16,24,33,34,28),PTS=c(10,14,12,21,18))
Point3Field <- data.frame(count=c(0,1,1,2,2),counts=c(1,2,7,4,5))
Point3Field$percent <- (Point3Field$count/Point3Field$counts)*100
JeremyLin.2016 <- list(Date,Team,Time.PTS,Point3Field)
names(JeremyLin.2016) <- c("Date","Team","Time.PTS","Point3Field")

JeremyLin.2016$Time.PTS[which(JeremyLin.2016$Date=="10月30日"),]

JeremyLin.2016$Point3Field$count>=2
#?

#string
strs <- c("Hello R World")
unlist(strsplit(strs," "))#list\  ?
xVector <- unique(unlist(strsplit("Coffee produced using the drying method is known as natural coffee"," ")))

paste("R",1:5,sep = "")
paste(c("Spades","Hearts","Diamonds","Clubs"),rep(c("A",2:10,"J","Q","K"),each=4,times=1),seq="")
paste(rep(c("Spades","Hearts","Diamonds","Clubs"),each=13,times=1),c("A",2:10,"J","Q","K"),seq="")

#grep(pattern, x)：搜寻字符串 pattern：代表寻找模式 x：字符串向量
#sub(pattern, replacement, x)：更改搜寻的字符串 pattern：搜寻的字符串，replacement：欲取代的字符串

studentID <- c("A002","A003","C005","C007","D001","E003","E006 ","E010")
table(substr(studentID,1,1))

state.name[grep("New",state.name)]
state.name[grep(" ",state.name)]
state.name[grep(" +",state.name)]
sub('M','m',state.name[grep("M",state.name)])

str1 <- c("ch6.xls","ch7.xls","ch7.c","ch7.doc","ch8.xls");
grep(pattern = "ch[\\^d].xls",x=str1)

#list
table(state.region)["South"][[1]]
sum(state.region=="South")
state.name[which(state.region=="South")]
names(tail(sort(state.x77[,1]),1))#first
names(head(sort(state.x77[,1]),1))#last


#Date
str(Sys.Date())
weekdays(Sys.Date()+1:10)
seq(Sys.Date(),by="1 day",length.out = 10)

seq(Sys.Date(),by="1 week",length.out = 6)
Sys.Date()-0:61
quarters(Sys.Date())
#?

# d m Y H M S 
Sys.time()# 北京时间，China Standard Time
as.POSIXct("15 12 91",format="%d %m %y")

#ts 
nums <- c(271450,283661,305312,260345,247530,227070,216419,205854,204459,204414)
nums.birth <- ts(nums,start=1998,end = 2007,frequency = 1)
#View(nums.birth)
#runif 均匀分布:runif(n,min=0,max=1)    n表示生成的随机数数量，min表示均匀分布的下限，max表示均匀分布的上限；
#若省略参数min、max,则默认生成[0,1]上的均匀分布随机数
#rnorm 正态分布（n,mean=0,sd=1）  其中n表示生成的随机数数量，mean是正态分布的均值，
#默认为0，sd是正态分布的标准差，默认时为1;
#rbinom(n,size,prob)   n表示生成的随机数数量，size表示进行贝努力试验的次数，prob表示一次贝努力试验成功的概率
#指数分布rexp（n,lamda=1） n表示生成的随机数个数，lamda=1/mean

ts(runif(10,min = 100,max=1000),start = c(2017,3,4),end = c(2017,3,14),frequency = 365)

#Function
percent <- function(x,digits=2){
  #return(parse(round(x*100,digits = digits),"%",sep=""))
  if ( !is.numeric(x))
  {
    print("需传入数值向量")
    return(NULL)
  }
  x.percent <- round(x * 100, digits = digits)   #执行转换
  x.final <- paste(x.percent, sep = "","%") #加上百分比
  return(x.final)                           #传回
}
percent(1/3,3)

#fUNCTION USE
percent <- function(x, ...)     #设计通用函数
{
  UseMethod("percent")
}
# 将数值向量转成百分比
percent.numeric <- function( x, Xfun = round, ...)
{
  x.percent <- Xfun(x * 100, ...)
  paste(x.percent, sep = "", "%")
}

# 将字符向量增加百分比符号
percent.character <- function(x)
{
  paste(x, sep = "","%")
}
# 设计默认函数
percent.default <- function(x)
{
  print("你所传递的参数无法处理")
} 
percent('A')
percent(1/3,digits = 3)
percent(NA)

#
#dgree
#
degprice <- function(x){
  UseMethod("degprice")
}

